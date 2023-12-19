import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/random_data.dart';

class FirebaseAuthFunctions {
  static const String _docid = 'user_id';
  static const String _password = 'password';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;

  static Future<bool> isUserNameAlreadyPresent(String username) async {
    return (await _instance.collection("usernames").get()).docs.any(
          (element) => element.id == username,
        );
  }

  //add user
  static Future<void> addUser({
    required String username,
    required String docID,
    required String password,
  }) async {
    await _instance.collection('users').doc(docID).set(SomeData.map(username));
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

  //user ID
  static Future<String> getUserId(String username) async {
    for (final QueryDocumentSnapshot<Map<String, dynamic>> e
        in (await _instance.collection("usernames").get()).docs) {
      if (e.id == username) {
        return e[_docid];
      }
    }
    return '';
  }
}
