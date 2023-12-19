import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/presentation/user/single_course/widgets/show_levels_part.dart';
import 'package:cyber_bee/presentation/user/single_course/widgets/show_part.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowLevelWdget extends StatelessWidget {
  ShowLevelWdget({
    super.key,
    required this.course,
  });

  final QueryDocumentSnapshot<Object?> course;

  ValueNotifier<String> level = ValueNotifier('001');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 41, 42, 43),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              20,
            ),
          ),
        ),
        child: Column(
          children: [
            ShowLevelsPart(course: course, level: level),
            ShowPartsWidget(level: level, course: course),
          ],
        ),
      ),
    );
  }
}
