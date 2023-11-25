import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/courses/course_models.dart';
import 'package:cyber_bee/core/firebase/courses/courses.dart';
import 'package:cyber_bee/presentation/admin/course/widgets/custom_text_form_field.dart';
import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';

class LevelDetailsGettingDialoge extends StatelessWidget {
  LevelDetailsGettingDialoge({
    super.key,
    required this.courseName,
  });
  final TextEditingController levelName = TextEditingController();
  final TextEditingController levelNo = TextEditingController();
  final String courseName;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: MyColors.backgroundBlackColor,
      title: Text(
        'Level details',
        style: MyTextStyles.h3,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      children: [
        CustomTextFormField(
          courseName: levelName,
          hintText: 'Level Name',
        ),
        k20Height,
        CustomTextFormField(
          courseName: levelNo,
          hintText: 'Level Number',
        ),
        k20Height,
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: circleRad(
                20,
              ),
              color: MyColors.secondaryGreyColor,
            ),
            width: 50,
            child: TextButton(
              onPressed: () async {
                if (levelName.text.isNotEmpty && levelNo.text.isNotEmpty) {
                  final MyLevel level = MyLevel(
                    levelNumber: levelNo.text,
                    levelName: levelName.text,
                    courseName: courseName,
                  );
                  try {
                    await GetAllCourseDetails.addLevel(level).then(
                      (value) => Navigator.pop(context),
                    );
                  } catch (e) {
                    // ignore: use_build_context_synchronously
                    mySnakbar(
                      context,
                      e.toString(),
                    );
                  }
                }
              },
              child: Text(
                'Ok',
                style: MyTextStyles.h4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
