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
          controller: _pdf,
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'Pdf link is required';
            } else if (!v.contains('docs.google.com/document')) {
              return 'Need a valid url';
            }
          },
          hintText: 'Pdf Link',
        ),
        k30Height,
        k30Height,
        MyCustomButton(
          function: () {},
          text: 'Add PDF',
        ),
      ],
    );
  }
}
