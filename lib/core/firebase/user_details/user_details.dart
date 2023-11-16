import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  static late String userId;
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  Future<String> getUsername() async {
    return (await _instance.collection('users').doc(userId).get())
            .data()?['username'] ??
        '';
  }

  Future<bool> isadmin() async {
    return (await _instance.collection('users').doc(userId).get())
            .data()?['isAdmin'] ??
        false;
  }
}
