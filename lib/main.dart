import 'package:cyber_bee/core/firebase/firebase_options.dart';
import 'package:cyber_bee/presentation/Home/home.dart';
import 'package:cyber_bee/presentation/starter/starter_first_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StarterFirstScreen(),
      routes: {
        'home':(context) => const ScreenHome(),
      },
    );
  }
}
