import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickProfilePicture {
  static Future<XFile?> pickImage(BuildContext context) async {
    return await ImagePicker().pickImage(source: ImageSource.gallery).then(
      (image) {
        if (image == null) {
          mySnakbar(context, 'Picked image is empty');
          return null;
        } else {
          return image;
        }
      },
    );
  }
}
