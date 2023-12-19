import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/presentation/user/single_course/widgets/show_level.dart';
import 'package:flutter/material.dart';

class CourseAllPartScreen extends StatelessWidget {
  const CourseAllPartScreen({
    super.key,
    required this.course,
  });
  final QueryDocumentSnapshot course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.id),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ShowLevelWdget(course: course),
            ],
          ),
        ),
      ),
    );
  }
}

