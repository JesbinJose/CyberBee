import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  static late String userId;
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static final DocumentReference<Map<String, dynamic>> _user =
      _instance.collection('users').doc(userId);

  static Future<String> getUsername() async {
    return (await _user.get()).data()?['username'] ?? '';
  }

  static Future<bool> isadmin() async {
    return (await _user.get()).data()?['isAdmin'] ?? false;
  }

  //User Courses
  static Stream<QuerySnapshot> getAllCourseInProgress() {
    return _user.collection('courses_in_progress').snapshots();
  }

  static Future<double> getProgress() async {
    return (await _user.collection('courses_in_progress').get()).docs.length /
        (await _instance.collection('courses').get()).docs.length;
  }

  static Stream<QuerySnapshot> getAllCertificate() {
    return _user.collection("certificates").snapshots();
  }

  static Future<String> getProfilePicLink()async {
    return (await _user.get()).data()!['profile_pic'];
  }
}
