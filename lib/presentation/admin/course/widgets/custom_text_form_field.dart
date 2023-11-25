import 'package:cyber_bee/constants/text_styles.dart';
import 'package:cyber_bee/constants/widgets.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController courseName,
    required this.hintText,
    this.inputType = TextInputType.text,
    this.textInputAction,
    this.minLine,
    this.maxLine = 1,
  }) : _courseName = courseName;

  final String hintText;
  final TextEditingController _courseName;
  final TextInputType inputType;
  final TextInputAction? textInputAction;
  final int? minLine;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      minLines: minLine,
      maxLines: maxLine,
      textInputAction: textInputAction,
      keyboardType: inputType,
      style: MyTextStyles.h4,
      controller: _courseName,
      decoration: myFormFieldInputDecoration(
        icon: null,
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'this field is empty';
        }
        return null;
      },
    );
  }
}
