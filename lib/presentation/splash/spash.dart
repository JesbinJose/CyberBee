import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
import 'package:cyber_bee/core/starter_controls/starter_controller.dart';
import 'package:cyber_bee/presentation/login/login_screen.dart';
import 'package:cyber_bee/presentation/main/main_screen.dart';
import 'package:cyber_bee/presentation/starter/starter_first_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';

enum Screen {
  home,
  login,
  starter,
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Screen screen = Screen.starter;
    StarterControl.isStarterPresented().then(
      (value) {
        if (!value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const StarterFirstScreen(),
            ),
          );
        } else {
          StarterControl.isLoginin().then(
            (v) {
              if (v.isNotEmpty) {
                screen = Screen.home;
                UserDetails.userId = v;
              } else {
                screen = Screen.login;
              }
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return screen == Screen.home
                        ? const MainScreen()
                        : LoginScreen();
                  },
                ),
              );
            },
          );
        }
      },
    );

    return const Scaffold(
      backgroundColor: MyColors.backgroundBlackColor,
    );
  }
}
