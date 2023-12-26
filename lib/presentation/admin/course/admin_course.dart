import 'package:cyber_bee/presentation/admin/course/widgets/add_and_see_course.dart';
import 'package:cyber_bee/presentation/admin/widgets/admin_top_view.dart';
import 'package:cyber_bee/presentation/widgets/custom_title_text.dart';
import 'package:flutter/material.dart';

class AdminCourseScreen extends StatelessWidget {
  const AdminCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTopViewForAdmin(),
                CustomTitleTextWidget(
                  title: 'Courses',
                ),
                AdminCourseView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


