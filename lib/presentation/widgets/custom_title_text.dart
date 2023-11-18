import 'package:cyber_bee/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTitleTextWidget extends StatelessWidget {
  final String title;
  const CustomTitleTextWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Text(
        title,
        style: MyTextStyles.h3,
      ),
    );
  }
}
