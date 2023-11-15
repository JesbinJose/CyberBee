import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthFunctions {
  static const String _docid = 'doc_id';
  static const String _password = 'password';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static Future<bool> isUserNameAlreadyPresent(String username) async {
    return (await _instance.collection("usernames").get()).docs.any(
          (element) => element.id == username,
        );
  }

  //add user
  Future<void> addUser({
    required String username,
    required String docID,
    required String password,
  }) async {
    await _instance.collection('usernames').doc(username).set({
      _docid: docID,
      _password: password,
    });
  }

  //login
  static Future<bool> isPasswordCorrect(
    String username,
    String password,
  ) async {
    return (await _instance.collection("usernames").get()).docs.any(
          (e) => e.id == username && e[_password] == password,
        );
  }

  static Future<String> getUserId(String username) async {
    String userId = '';
    for (final QueryDocumentSnapshot<Map<String, dynamic>> e
        in (await _instance.collection("usernames").get()).docs) {
      if (e.id == username) {
        userId = e[_docid];
      }
    }
    return userId;
  }
}
