import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase_auth/firebase_auth.dart';
import 'package:cyber_bee/presentation/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPhoneScreen extends StatelessWidget {
  AuthPhoneScreen({super.key});

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundBlackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              MyAssetsImages.cyberbeeRoboImage,
              width: 300,
              height: 300,
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration: myFormFieldInputDecoration(
                      icon: CupertinoIcons.phone,
                      hintText: 'Phone number',
                    ),
                  ),
                  k30Height,
                  k30Height,
                  MyCustomButton(
                    function: () async {
                      await MyFirebaseAuth.signInWithPhoneNumber(
                        context,
                        _phoneNumberController.text,
                      );
                    },
                    text: 'Send OTP',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
