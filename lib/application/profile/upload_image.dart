// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cyber_bee/application/profile/pick_image.dart';
import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
import 'package:cyber_bee/core/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage {
  static Future<void> uploadImage(BuildContext context) async {
    final XFile? file = await PickProfilePicture.pickImage(context);
    if (file != null) {
      final String? imageUrl =
          await FireBaseStorage.upladImageToFirebaseStorage(
        context,
        file: File(file.path),
        userId: UserDetails.userId,
      );
      if (imageUrl != null) {
        await UserDetails.addProfilePic(imageUrl);
      }
    }
  }
}
