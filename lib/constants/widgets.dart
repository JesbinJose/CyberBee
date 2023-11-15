import 'package:cyber_bee/constants/my_colors.dart';
import 'package:cyber_bee/constants/text_styles.dart';
import 'package:flutter/material.dart';

const SizedBox k10Height = SizedBox(height: 10);
const SizedBox k20Height = SizedBox(height: 20);
const SizedBox k30Height = SizedBox(height: 30);
const SizedBox k10Width = SizedBox(width: 10);
const SizedBox k20Width = SizedBox(width: 20);
const SizedBox k30Width = SizedBox(width: 30);
Widget ratioSize(int flex) {
  return Expanded(
    flex: flex,
    child: const SizedBox.shrink(),
  );
}

InputDecoration myFormFieldInputDecoration({
  required IconData icon,
  required String hintText,
}) {
  return InputDecoration(
    prefixIcon: Icon(
      icon,
      color: MyColors.textWhiteColor,
    ),
    hintText: hintText,
    hintStyle: MyTextStyles.h5,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: MyColors.secondarybackgroundColor.withOpacity(0.6),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: MyColors.secondarybackgroundColor,
      ),
    ),
  );
}
