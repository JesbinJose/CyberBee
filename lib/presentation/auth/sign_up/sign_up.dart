import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/presentation/auth/sign_up/widgets/custom_text_field.dart';
import 'package:cyber_bee/presentation/auth/sign_up/widgets/validate_button.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUPScreen extends StatelessWidget {
  final String userId;
  SignUPScreen({
    super.key,
    required this.userId,
  });

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordTwice = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ratioSize(2),
              Lottie.asset(
                MyAssetsLottie.redTick,
                width: 250,
              ),
              ratioSize(1),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          _formKey.currentState!.validate();
                        },
                        style: MyTextStyles.h4,
                        controller: _username,
                        decoration: myFormFieldInputDecoration(
                          icon: CupertinoIcons.person,
                          hintText: 'Username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter username";
                          }
                          return null;
                        },
                      ),
                      k30Height,
                      CustomTextFromField(
                        passwordTwice: _passwordTwice,
                        formKey: _formKey,
                        password: _password,
                        hintText: 'Password',
                        function: (value) {
                          if (value == null || value.length < 5) {
                            return "Enter at least 6 characters for password";
                          } else if (value != _passwordTwice.text) {
                            return 'Enter same password';
                          }
                          return null;
                        },
                        icon: Icons.lock_person,
                      ),
                      k30Height,
                      CustomTextFromField(
                        passwordTwice: _passwordTwice,
                        formKey: _formKey,
                        password: _password,
                        hintText: 'Confirm Password',
                        function: (value) {
                          if (value != _password.text) {
                            return 'Enter same password';
                          }
                          return null;
                        },
                        icon: Icons.lock_person,
                      ),
                      k30Height,
                      k30Height,
                      ValidateButton(
                        formKey: _formKey,
                        username: _username,
                        userId: userId,
                        password: _password,
                        passwordTwice: _passwordTwice,
                      ),
                    ],
                  ),
                ),
              ),
              ratioSize(10),
            ],
          ),
        ),
      ),
    );
  }
}
