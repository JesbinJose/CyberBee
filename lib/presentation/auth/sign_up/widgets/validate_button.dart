import 'package:cyber_bee/core/firebase/user_details/firebase_functions.dart';
import 'package:cyber_bee/presentation/auth/login/login_screen.dart';
import 'package:cyber_bee/presentation/widgets/custom_button.dart';
import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';

class ValidateButton extends StatelessWidget {
  const ValidateButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController username,
    required this.userId,
    required TextEditingController password,
    required TextEditingController passwordTwice,
  })  : _formKey = formKey,
        _username = username,
        _password = password,
        _passwordTwice = passwordTwice;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _username;
  final String userId;
  final TextEditingController _password;
  final TextEditingController _passwordTwice;

  @override
  Widget build(BuildContext context) {
    return MyCustomButton(
      function: () async {
        if (_formKey.currentState!.validate()) {
          if (await FirebaseAuthFunctions.isUserNameAlreadyPresent(
            _username.text,
          )) {
            // ignore: use_build_context_synchronously
            mySnakbar(context, 'Username is already taken');
          } else {
            await FirebaseAuthFunctions.addUser(
              username: _username.text,
              docID: userId,
              password: _password.text,
            ).then((value) {
              _password.dispose();
              _passwordTwice.dispose();
              _username.dispose();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            });
          }
        }
      },
      text: 'Sign Up',
    );
  }
}
