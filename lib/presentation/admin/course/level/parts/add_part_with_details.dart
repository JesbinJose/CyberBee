import 'package:cyber_bee/core/firebase/courses/course_models.dart';
import 'package:cyber_bee/presentation/admin/course/level/parts/dif_parts/exam.dart';
import 'package:cyber_bee/presentation/admin/course/level/parts/dif_parts/pdf.dart';
import 'package:cyber_bee/presentation/admin/course/level/parts/dif_parts/videos.dart';
import 'package:cyber_bee/presentation/admin/course/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddPartToLevelInputScreen extends StatelessWidget {
  AddPartToLevelInputScreen({
    super.key,
    required this.course,
    required this.levelNo,
  });
  final String course;
  final String levelNo;
  final TextEditingController _partName = TextEditingController();
  final TextEditingController _partNo = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ValueNotifier<PartType> _type = ValueNotifier<PartType>(PartType.exam);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              courseName: _partName,
              hintText: 'Enter the name of the part',
            ),
            CustomTextFormField(
              courseName: _partNo,
              hintText: 'Enter the Number in order of the part',
            ),
            DropdownButton(
              items: const [
                DropdownMenuItem(
                  value: PartType.video,
                  child: Text('Video'),
                ),
                DropdownMenuItem(
                  value: PartType.pdf,
                  child: Text('PDF'),
                ),
                DropdownMenuItem(
                  value: PartType.exam,
                  child: Text('Exam'),
                ),
              ],
              onChanged: (v) {},
            ),
            ValueListenableBuilder(
              valueListenable: _type,
              builder: (context, value, child) {
                switch (value) {
                  case PartType.exam:
                    return const PartExamAddWidget();
                  case PartType.pdf:
                    return const PartPdfAddWidget();
                  default:
                    return const PartVideoAddWidget();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
