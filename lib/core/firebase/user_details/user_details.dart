import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  static String userId = '';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static final DocumentReference<Map<String, dynamic>> _user =
      _instance.collection('users').doc(userId);

  static Future<String> getUsername() async {
    return (await _user.get()).data()?['username'] ?? '';
  }

  static Future<bool> isadmin() async {
    return (await _user.get()).data()?['isAdmin'] ?? false;
  }

  static Future<double> getProgress() async {
    return (await _user.collection('courses_in_progress').get()).docs.length /
        (await _instance.collection('courses').get()).docs.length;
  }

  static Stream<QuerySnapshot> getAllCertificate() {
    return _user.collection("certificates").snapshots();
  }

  static Future<void> addProfilePic(String path) async {
    _user.update({'profile_pic': path});
  }

  static Future<String> getProfilePicLink() async {
    return (await _user.get()).data()!['profile_pic'];
  }

  static Future<List> getCoursesInprogress(String userId) async {
    return (await _user.get()).data()!['courses'] as List;
  }

  static Future enrollCourse(DocumentReference course) async {
    await _user.update({
      'courses': FieldValue.arrayUnion([course]),
    });
  }

  static Future<List> getAllNotifications() async {
    return (await _user.get()).data()!['notification'];
  }
}
