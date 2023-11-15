import 'package:cyber_bee/constants/my_colors.dart';
import 'package:cyber_bee/constants/text_styles.dart';
import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final VoidCallback function;
  final String text;
  final Color? color;

  const MyCustomButton({
    super.key,
    this.color,
    required this.function,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          color: color??MyColors.primaryRedColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Text(
          text,
          style: MyTextStyles.h4,
        ),
      ),
    );
  }
}
