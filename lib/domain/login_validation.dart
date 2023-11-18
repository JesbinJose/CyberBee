// ignore_for_file: use_build_context_synchronously
import 'package:cyber_bee/core/firebase/user_details/firebase_functions.dart';
import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
import 'package:cyber_bee/core/starter_controls/starter_controller.dart';
import 'package:cyber_bee/presentation/course/course.dart';
import 'package:cyber_bee/presentation/home/home.dart';
import 'package:cyber_bee/presentation/main/main_screen.dart';
import 'package:cyber_bee/presentation/profile/profile.dart';
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
          final String userId = await FirebaseAuthFunctions.getUserId(
            username,
          );
          UserDetails.userId = userId;
          if (isAutoLogin) {
            await StarterControl.setAutoLogin(userId);
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(
                screens: const [
                  ScreenHome(),
                  CourseScreen(),
                  ProfileScreen(),
                ],
              ),
            ),
          );
        }
      }
    }
  }
}
