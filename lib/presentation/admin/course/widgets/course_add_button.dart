
import 'dart:io';

import 'package:cyber_bee/core/firebase/courses/course_models.dart';
import 'package:cyber_bee/core/firebase/courses/courses.dart';
import 'package:cyber_bee/core/firebase_storage.dart';
import 'package:cyber_bee/presentation/admin/course/level/add_level_screen.dart';
import 'package:cyber_bee/presentation/widgets/custom_button.dart';
import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';

class CourseAddButton extends StatelessWidget {
  const CourseAddButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required ValueNotifier<String> intoImageLink,
    required TextEditingController courseName,
    required TextEditingController description,
    required TextEditingController amount,
    required TextEditingController discount,
    required TextEditingController introVideo,
  })  : _formKey = formKey,
        _intoImageLink = intoImageLink,
        _courseName = courseName,
        _description = description,
        _amount = amount,
        _discount = discount,
        _introVideo = introVideo;

  final GlobalKey<FormState> _formKey;
  final ValueNotifier<String> _intoImageLink;
  final TextEditingController _courseName;
  final TextEditingController _description;
  final TextEditingController _amount;
  final TextEditingController _discount;
  final TextEditingController _introVideo;

  @override
  Widget build(BuildContext context) {
    return MyCustomButton(
      function: () async {
        if (_formKey.currentState!.validate()) {
          if (_intoImageLink.value.isNotEmpty) {
            final String? imageLink =
                await FireBaseStorage.upladImageToFirebaseStorage(
              context,
              file: File(_intoImageLink.value),
              userId: _courseName.text,
            );
            MyCourse course = MyCourse(
              courseName: _courseName.text,
              description: _description.text,
              amount: int.parse(_amount.text),
              discount: int.parse(_discount.text),
              introVideo: _introVideo.text,
              introImageLink: imageLink ?? '',
            );
            await GetAllCourseDetails.addCourse(course);
            // ignore: use_build_context_synchronously
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AddLevelScreen(
                  courseName: _courseName.text,
                ),
              ),
            );
          } else {
            mySnakbar(context, 'Select the image');
          }
        }
      },
      text: 'Next',
    );
  }
}
