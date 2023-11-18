import 'package:cyber_bee/presentation/auth/otp/otp.dart';
import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyFirebaseAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static String _verificationId = '';
  static Future<bool> signInWithPhoneNumber(
    BuildContext context,
    String phoneNumber,
  ) async {
    bool isVerificationOK = false;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        _verificationId = verificationId;
        isVerificationOK = true;
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) async {
        await Future.delayed(
          const Duration(
            minutes: 5,
          ),
        );
      },
    );
    return isVerificationOK;
  }

  static Future<String> verifyOTP(
      {required String smsCode, required context}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      User? user = (await _auth.signInWithCredential(credential)).user;
      if (user != null) {
        return user.uid;
      }
    } on FirebaseAuthException catch (e) {
      mySnakbar(context, e.message.toString());
    }
    return '';
  }
}
