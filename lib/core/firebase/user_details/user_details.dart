// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';

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
    return ((await _user.get()).data()!['courses'] as List).length /
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

  static Future enrollCourse(
      DocumentReference course, BuildContext context) async {
    try {
      await _user.update({
        'courses': FieldValue.arrayUnion([course]),
      });
    } catch (e) {
      mySnakbar(context, e.toString());
    }
  }

  static Future<List> getAllNotifications() async {
    return (await _user.get()).data()!['notification'] as List;
  }

  static Future<void> deleteNotification(final i) async {
    var up = ((await _user.get()).data()!['notification'] as List).removeAt(i);
    await _user.update({'notification': up});
  }
}
