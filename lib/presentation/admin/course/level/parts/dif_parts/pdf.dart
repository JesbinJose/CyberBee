import 'package:cyber_bee/constants/widgets.dart';
import 'package:cyber_bee/presentation/admin/course/widgets/custom_text_form_field.dart';
import 'package:cyber_bee/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PartPdfAddWidget extends StatelessWidget {
  PartPdfAddWidget({super.key});

  final TextEditingController _pdf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          courseName: _pdf,
          hintText: 'Pdf Link',
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
