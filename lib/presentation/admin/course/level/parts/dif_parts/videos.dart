import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/constants/regex.dart';
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
          controller: _video,
          hintText: 'Video Link',
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'Video link is required';
            } else if (!RegExp(ytlinkVal).hasMatch(v)) {
              return 'Valid link is nessasary';
            }
          },
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
