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

  static Future<String?> isLoginin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  static Future<void> setAutoLogin(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }
}
