import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/constants/regex.dart';
import 'package:cyber_bee/presentation/admin/course/widgets/course_add_button.dart';
import 'package:cyber_bee/presentation/admin/course/widgets/pick_image_controll.dart';
import 'package:cyber_bee/presentation/admin/course/widgets/custom_text_form_field.dart';
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
                    controller: _courseName,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Name is required';
                      }
                    },
                    hintText: 'Course Name',
                  ),
                  k20Height,
                  CustomTextFormField(
                    controller: _description,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Description is required';
                      }
                    },
                    hintText: 'Description',
                    minLine: 5,
                    maxLine: null,
                  ),
                  k20Height,
                  CustomTextFormField(
                    controller: _amount,
                    isNumOnly: true,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Amount is required';
                      }
                    },
                    hintText: 'Amount',
                    inputType: TextInputType.number,
                  ),
                  k20Height,
                  CustomTextFormField(
                    controller: _discount,
                    isNumOnly: true,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Discount is required';
                      } else if (int.parse(v) < 101 && int.parse(v) > 1) {
                        return 'Discount in percentage';
                      }
                    },
                    hintText: 'Discount',
                    inputType: TextInputType.number,
                  ),
                  k20Height,
                  CustomTextFormField(
                    controller: _introVideo,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Video Link is required';
                      } else if (!RegExp(ytlinkVal).hasMatch(v)) {
                        return 'Not Valid Video link';
                      }
                    },
                    hintText: 'Intro Video Link',
                  ),
                  k20Height,
                  PickImageControll(intoImageLink: _intoImageLink),
                  k30Height,
                  CourseAddButton(
                    formKey: _formKey,
                    intoImageLink: _intoImageLink,
                    courseName: _courseName,
                    description: _description,
                    amount: _amount,
                    discount: _discount,
                    introVideo: _introVideo,
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
