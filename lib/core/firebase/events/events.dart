import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/core/firebase_storage.dart';
import 'package:flutter/material.dart';

class MyFirebaseEvents {
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static Stream<QuerySnapshot> getAllEvents() {
    return _instance.collection('events').snapshots();
  }

  static Future<void> addEvent(
      String path, String link, BuildContext context) async {
    final String? imageLink =
        await FireBaseStorage.uploadEventImageToFirebaseStorage(
      context,
      file: File(path),
    );
    await _instance.collection('events').add({
      'image': imageLink,
      'link': link,
    });
  }
}
