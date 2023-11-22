import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/options/firebase_options.dart';
import 'package:cyber_bee/presentation/splash/spash.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.debug);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.backgroundBlackColor,
        appBarTheme: AppBarTheme(
          backgroundColor: MyColors.backgroundBlackColor,
          elevation: 0,
          titleTextStyle: MyTextStyles.h1,
          iconTheme: const IconThemeData(
            color: MyColors.iconSecondarywhiteColor,
          ),
        ),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
