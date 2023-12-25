import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StarterControl {
  static Future<bool> isStarterPresented() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isStarterPresent') == true) {
      return true;
    } else {
      await prefs.setBool('isStarterPresent', true);
      return false;
    }
  }

  static Future<String> isLoginin() async {
    if (FirebaseAuth.instance.currentUser == null) return "";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final instance = FirebaseFirestore.instance.collection('users');
    final String? userId = prefs.getString('username');
    if (userId == null || userId.isEmpty) return "";
    for (var user in (await instance.get()).docs) {
      if (user.id == userId) {
        final messageInstance = await FirebaseMessaging.instance.getToken();
        await instance.doc(userId).update({"messageId": messageInstance});
        return userId;
      }
    }
    await prefs.setString('username', "");
    return "";
  }

  static Future<void> setAutoLogin(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', "");
  }
}
