import 'package:cyber_bee/constants/constants.dart';
import 'package:flutter/material.dart';

class AddButtonAdmin extends StatelessWidget {
  final VoidCallback function;
  const AddButtonAdmin({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: circleRad(
          50,
        ),
        color: MyColors.primaryRedColor
      ),
      child: const Icon(
        Icons.add,
        size: 20,
        color: MyColors.backgroundBlackColor,
      ),
    ));
  }
}
