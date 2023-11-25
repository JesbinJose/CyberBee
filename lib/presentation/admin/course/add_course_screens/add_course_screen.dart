// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/courses/course_models.dart';
import 'package:cyber_bee/core/firebase/courses/courses.dart';
import 'package:cyber_bee/core/firebase_storage.dart';
import 'package:cyber_bee/presentation/admin/course/level/add_level_screen.dart';
import 'package:cyber_bee/presentation/admin/course/widgets/pick_image_controll.dart';
import 'package:cyber_bee/presentation/widgets/custom_button.dart';
import 'package:cyber_bee/presentation/admin/course/widgets/custom_text_form_field.dart';
import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';

class AddCourseScreen extends StatelessWidget {
  AddCourseScreen({super.key});
  final TextEditingController _courseName = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _discount = TextEditingController();
  final TextEditingController _introVideo = TextEditingController();
  final ValueNotifier<String> _intoImageLink = ValueNotifier<String>('');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  k30Height,
                  CustomTextFormField(
                    courseName: _courseName,
                    hintText: 'Course Name',
                  ),
                  k20Height,
                  CustomTextFormField(
                    courseName: _description,
                    hintText: 'Description',
                    minLine: 5,
                    maxLine: null,
                  ),
                  k20Height,
                  CustomTextFormField(
                    courseName: _amount,
                    hintText: 'Amount',
                    inputType: TextInputType.number,
                  ),
                  k20Height,
                  CustomTextFormField(
                    courseName: _discount,
                    hintText: 'Discount',
                    inputType: TextInputType.number,
                  ),
                  k20Height,
                  CustomTextFormField(
                    courseName: _introVideo,
                    hintText: 'Intro Video Link',
                  ),
                  k20Height,
                  PickImageControll(intoImageLink: _intoImageLink),
                  k30Height,
                  MyCustomButton(
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
                  ),
                  k30Height,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
