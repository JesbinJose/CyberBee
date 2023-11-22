import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailsForAdmin {
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static final CollectionReference<Map<String, dynamic>> _user =
      _instance.collection('users');
  static Future<List<QueryDocumentSnapshot<Object?>>> getAllStudents() async {
    final QuerySnapshot users = await _user.get();
    List<QueryDocumentSnapshot<Object?>> list = [];
    for (var user in users.docs) {
      if (!user['isAdmin']) {
        list.add(user);
      }
    }
    return list;
  }
}
