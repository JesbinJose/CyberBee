import 'package:cyber_bee/application/profile/upload_image.dart';
import 'package:cyber_bee/constants/constants.dart';
import 'package:flutter/material.dart';

class UserAccountSettingsScreen extends StatelessWidget {
  const UserAccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Settings'),),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'Change profile pic',
              style: MyTextStyles.h4,
            ),
            onTap: () async => await UploadImage.uploadImage(context),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}

