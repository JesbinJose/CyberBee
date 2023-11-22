import 'package:cyber_bee/constants/text_styles.dart';
import 'package:cyber_bee/constants/widgets.dart';
import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.passwordTwice,
    required this.formKey,
    required this.password,
    required this.hintText,
    required this.function,
    required this.icon,
  });

  final TextEditingController passwordTwice;
  final GlobalKey<FormState> formKey;
  final TextEditingController password;
  final String hintText;
  final String? Function(String?) function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: MyTextStyles.h4,
      controller: passwordTwice,
      decoration: myFormFieldInputDecoration(
        icon: icon,
        hintText: 'Confirm Password',
      ),
      onChanged: (value) {
        formKey.currentState!.validate();
      },
      validator: function,
    );
  }
}
