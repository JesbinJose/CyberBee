
import 'package:cyber_bee/constants/widgets.dart';
import 'package:cyber_bee/core/firebase/user_details/firebase_functions.dart';
import 'package:cyber_bee/presentation/widgets/async_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsernameCheckTextField extends StatelessWidget {
  const UsernameCheckTextField({
    super.key,
    required TextEditingController userNameController,
  }) : _userNameController = userNameController;

  final TextEditingController _userNameController;

  @override
  Widget build(BuildContext context) {
    return AsyncTextFormField(
      isNumberAllowed: false,
      valueIsEmptyMessage: "Please enter username",
      isValidatingMessage: "Checking for the username",
      valueIsInvalidMessage: "Username is Not registered",
      validator: (value) async {
        if (!await FirebaseAuthFunctions.isUserNameAlreadyPresent(
          value,
        )) {
          return false;
        }
        return true;
      },
      validationDebounce: const Duration(
        seconds: 2,
      ),
      controller: _userNameController,
      decoration: myFormFieldInputDecoration(
        icon: CupertinoIcons.phone,
        hintText: 'Username',
      ),
    );
  }
}
