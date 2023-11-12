import 'package:cyber_bee/constants/my_colors.dart';
import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final VoidCallback function;
  final String text;

  const MyCustomButton({
    super.key,
    required this.function,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: const BoxDecoration(
          color: MyColors.primaryRedColor,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Text(text,),
      ),
    );
  }
}
