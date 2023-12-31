import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/options/firebase_options.dart';
import 'package:cyber_bee/presentation/splash/spash.dart';
import 'package:cyber_bee/push_notification.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> _firebaseBackgroundMessaging(RemoteMessage message) async {
  if (message.notification != null) {
    debugPrint(message.messageId!);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessaging);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
  );
  await PushNotifications.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cyber Bee',
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.backgroundBlackColor,
        iconTheme: const IconThemeData(
          color: MyColors.iconSecondarywhiteColor,
        ),
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
