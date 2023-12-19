import 'dart:convert';
import 'dart:io';

import 'package:cyber_bee/core/firebase/options/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendPushNotification {
  Future<void> sendMessage({
    required String title,
    required String message,
    required String toUserId,
  }) async {
    final body = {
      "to": toUserId,
      "notification": <String, String>{
        "title": title,
        "body": message,
      },
    };
    var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    try {
      await http
          .post(
            url,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.authorizationHeader: PushNKey.getKey(),
            },
            body: jsonEncode(body),
          )
          .then(
            (value) => debugPrint(
              value.statusCode.toString(),
            ),
          );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
