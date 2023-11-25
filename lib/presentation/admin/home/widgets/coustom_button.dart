import 'package:cyber_bee/constants/my_colors.dart';
import 'package:cyber_bee/constants/text_styles.dart';
import 'package:cyber_bee/constants/widgets.dart';
import 'package:flutter/material.dart';

class CustomButtonAdmin extends StatelessWidget {
  const CustomButtonAdmin({
    super.key,
    required this.title,
    required this.function,
  });
  final String title;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: circleRad(
            40,
          ),
          color: MyColors.iconSecondarywhiteColor.withOpacity(
            0.3,
          ),
        ),
        width: 110,
        height: 40,
        child: Center(
          child: Text(
            title,
            style: MyTextStyles.h5,
          ),
        ),
      ),
    );
  }
}
