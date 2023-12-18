import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/courses/courses.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                color: MyColors.iconPrimaryGreyColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    20,
                  ),
                ),
              ),
              child: StreamBuilder(
                stream: GetAllCourseDetails.getAllLevels(course.id),
                builder: (context, snapshot) {
                  if (snapshot.data == null) return const SizedBox();
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final level = snapshot.data!.docs[index];
                      return SizedBox(
                        height: 50,
                        child: Text(level['']),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    itemCount: 4,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
