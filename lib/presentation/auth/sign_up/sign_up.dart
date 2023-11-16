import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/user_details/firebase_functions.dart';
import 'package:cyber_bee/presentation/login/login_screen.dart';
import 'package:cyber_bee/presentation/widgets/custom_button.dart';
import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
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
      backgroundColor: MyColors.backgroundBlackColor,
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
                      TextFormField(
                        style: MyTextStyles.h4,
                        controller: _password,
                        decoration: myFormFieldInputDecoration(
                          icon: Icons.lock_person,
                          hintText: 'Password',
                        ),
                        validator: (value) {
                          if (value == null || value.length < 5) {
                            return "Enter at least 6 characters for password";
                          } else if (value != _passwordTwice.text) {
                            return 'Enter same password';
                          }
                          return null;
                        },
                      ),
                      k30Height,
                      TextFormField(
                        style: MyTextStyles.h4,
                        controller: _passwordTwice,
                        decoration: myFormFieldInputDecoration(
                          icon: Icons.lock_person,
                          hintText: 'Confirm Password',
                        ),
                        validator: (value) {
                          if (value != _password.text) {
                            return 'Enter same password';
                          }
                          return null;
                        },
                      ),
                      k30Height,
                      k30Height,
                      MyCustomButton(
                        function: () async {
                          if (_formKey.currentState!.validate()) {
                            if (await FirebaseAuthFunctions
                                .isUserNameAlreadyPresent(
                              _username.text,
                            )) {
                              // ignore: use_build_context_synchronously
                              mySnakbar(context, 'Username is already taken');
                            } else {
                              await FirebaseAuthFunctions.addUser(
                                username: _username.text,
                                docID: userId,
                                password: _password.text,
                              ).then(
                                (value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                ),
                              );
                            }
                          }
                        },
                        text: 'Sign Up',
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
