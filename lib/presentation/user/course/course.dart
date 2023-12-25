import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/presentation/user/course/widgets/certificate_part.dart';
import 'package:cyber_bee/presentation/user/course/widgets/course_progress_part.dart';
import 'package:cyber_bee/presentation/user/course/widgets/course_view_widget.dart';
import 'package:cyber_bee/presentation/widgets/custom_title_text.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              k30Height,
              CourseProgressContainerWidget(),
              k20Height,
              CustomTitleTextWidget(title: 'Course in progress'),
              CustomCourseView(),
              CustomTitleTextWidget(title: 'My Certificates'),
              k10Height,
              CertificatePart(),
            ],
          ),
        ),
      ),
    );
  }
}
