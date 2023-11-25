import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase_auth/firebase_auth.dart';
import 'package:cyber_bee/presentation/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPhoneScreen extends StatelessWidget {
  AuthPhoneScreen({super.key});

  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: MyTextStyles.h4,
                    controller: _phoneNumberController,
                    decoration: myFormFieldInputDecoration(
                      icon: CupertinoIcons.phone,
                      hintText: 'Phone number',
                    ),
                    validator: (value) {
                      if (value != null && value.length < 6) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  k30Height,
                  k30Height,
                  MyCustomButton(
                    function: () async {
                      if (_formKey.currentState!.validate()) {
                        await MyFirebaseAuth.signInWithPhoneNumber(
                          context,
                          _phoneNumberController.text,
                        ).then((value) {
                          if (value) _phoneNumberController.dispose();
                        });
                      }
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
