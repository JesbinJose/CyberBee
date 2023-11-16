// ignore_for_file: use_build_context_synchronously

import 'package:cyber_bee/core/firebase/user_details/firebase_functions.dart';
import 'package:cyber_bee/core/starter_controls/starter_controller.dart';
import 'package:cyber_bee/presentation/main/main_screen.dart';
import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';

class ValidateLogin {
  static Future<void> validate({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required String username,
    required String password,
    required bool isAutoLogin,
  }) async {
    if (formKey.currentState!.validate()) {
      if (!await FirebaseAuthFunctions.isUserNameAlreadyPresent(username)) {
        mySnakbar(context, 'Username is not registered');
      } else {
        if (!await FirebaseAuthFunctions.isPasswordCorrect(
            username, password)) {
          mySnakbar(context, 'Password is incorrect');
        } else {
          if (isAutoLogin) {
            await StarterControl.setAutoLogin(
              await FirebaseAuthFunctions.getUserId(
                username,
              ),
            );
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
        }
      }
    }
  }
}
