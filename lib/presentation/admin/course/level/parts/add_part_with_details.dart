import 'package:cyber_bee/constants/constants.dart';
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
  final TextEditingController _description = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ValueNotifier<PartType> _type = ValueNotifier<PartType>(PartType.video);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomTextFormField(
                  courseName: _partName,
                  hintText: 'Enter the name of the part',
                ),
                k20Height,
                CustomTextFormField(
                  courseName: _partNo,
                  hintText: 'Enter the Number in order of the part',
                ),
                k20Height,
                CustomTextFormField(
                  courseName: _description,
                  hintText: 'Description',
                ),
                k20Height,
                DropdownMenu(
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(
                      value: PartType.video,
                      label: 'Video',
                    ),
                    DropdownMenuEntry(
                      value: PartType.pdf,
                      label: 'PDF',
                    ),
                    DropdownMenuEntry(
                      value: PartType.exam,
                      label: 'Exam',
                    ),
                  ],
                  onSelected: (value) => _type.value = value ?? PartType.video,
                  textStyle: MyTextStyles.h4,
                  initialSelection: PartType.video,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                ),
                k30Height,
                ValueListenableBuilder(
                  valueListenable: _type,
                  builder: (_, value,__) {
                    switch (value) {
                      case PartType.exam:
                        return const PartExamAddWidget();
                      case PartType.pdf:
                        return PartPdfAddWidget();
                      default:
                        return PartVideoAddWidget();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
