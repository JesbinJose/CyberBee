import 'package:cloud_firestore/cloud_firestore.dart';
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
      body:  Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
