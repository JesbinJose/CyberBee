import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/presentation/admin/course/widgets/custom_text_form_field.dart';
import 'package:cyber_bee/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PartVideoAddWidget extends StatelessWidget {
  PartVideoAddWidget({super.key});
  final TextEditingController _video = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          courseName: _video,
          hintText: 'Video Link',
        ),
        k30Height,
        k30Height,
        MyCustomButton(
          function: () {},
          text: 'Add Video',
        ),
      ],
    );
  }
}
