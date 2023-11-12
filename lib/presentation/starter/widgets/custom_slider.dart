import 'package:cyber_bee/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomStarterPageWidget extends StatelessWidget {
  final String title;
  final String image;
  final String thought;
  final int value;
  CustomStarterPageWidget({
    super.key,
    required this.title,
    required this.thought,
    required this.image,
    required this.value,
  });
  final List<Widget> widgets = [
    Container(
      width: 20,
      height: 5,
      decoration: const BoxDecoration(
        color: MyColors.textWhiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    ),
    const SizedBox(
      width: 5,
    ),
    Container(
      width: 5,
      height: 5,
      decoration: const BoxDecoration(
        color: MyColors.textWhiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SvgPicture.asset(
            image,
            height: 400,
            width: 400,
          ),
        ),
        Text(
          title,
          style: MyTextStyles.h1,
        ),
        k10Height,
        Text(
          thought,
          style: MyTextStyles.h5,
        ),
        k20Height,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: value == 1 ? widgets.reversed.toList() : widgets,
        ),
      ],
    );
  }
}
