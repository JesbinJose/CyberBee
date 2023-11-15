import 'package:cyber_bee/application/starter_controls/starter_controller.dart';
import 'package:cyber_bee/presentation/login/login_screen.dart';
import 'package:cyber_bee/presentation/starter/starter_first_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StarterControl.isStarterPresented().then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              value ? LoginScreen() : const StarterFirstScreen(),
        ),
      ),
    );
    return const Scaffold(
      backgroundColor: MyColors.backgroundBlackColor,
    );
  }
}
