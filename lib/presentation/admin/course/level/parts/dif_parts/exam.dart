import 'package:cyber_bee/constants/widgets.dart';
import 'package:cyber_bee/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PartExamAddWidget extends StatelessWidget {
  const PartExamAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        k30Height,
        MyCustomButton(
          function: () {},
          text: 'Add Question',
        ),
      ],
    );
  }
}