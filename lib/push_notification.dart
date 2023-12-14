import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotifications {
  static final _firebaseMessging = FirebaseMessaging.instance;

  static Future<void> init() async {
    await _firebaseMessging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }
}
