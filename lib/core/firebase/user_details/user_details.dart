// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';

class UserDetails {
  static String userId = '';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static DocumentReference<Map<String, dynamic>> user =
      _instance.collection('users').doc(userId);

  static Future<String> getUsername() async {
    return (await user.get()).data()?['username'] ?? '';
  }

  static Future<bool> isadmin() async {
    return (await user.get()).data()?['isAdmin'] ?? false;
  }

  static Future<double> getProgress() async {
    return ((await user.get()).data()!['courses'] as List).length /
        (await _instance.collection('courses').get()).docs.length;
  }

  static Stream<QuerySnapshot> getAllCertificate() {
    return user.collection("certificates").snapshots();
  }

  static Future<void> addProfilePic(String path) async {
    user.update({'profile_pic': path});
  }

  static Future<String> getProfilePicLink() async {
    return (await user.get()).data()!['profile_pic'];
  }

  static Future<List> getCoursesInprogress(String userId) async {
    List result = [];
    final List data = (await user.get()).data()!['courses'] as List;
    for (var ref in data as List<DocumentReference>) {
      final doc = await ref.get();
      if (doc.exists) {
        result.add(doc);
      }
    }
    if (result.length != data.length) {
      user.update({'courses': result});
    }
    return result;
  }

  static Future enrollCourse(
      DocumentReference course, BuildContext context) async {
    try {
      await user.update({
        'courses': FieldValue.arrayUnion([course]),
      });
    } catch (e) {
      mySnakbar(context, e.toString());
    }
  }

  static Future<List> getAllNotifications() async {
    return (await user.get()).data()!['notification'] as List;
  }

  static Future<void> deleteNotification(final i) async {
    var up = ((await user.get()).data()!['notification'] as List).removeAt(i);
    await user.update({'notification': up});
  }

  static deleteUserData() async {
    try {
      await user.delete();
      await _instance.collection('usernames').doc(userId).delete();
      final data = await _instance
          .collection('chat')
          .doc('toAdmin')
          .collection(userId)
          .get();
      for (var e in data.docs) {
        await e.reference.delete();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
