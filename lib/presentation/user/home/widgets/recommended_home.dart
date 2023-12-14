import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/core/firebase/courses/courses.dart';
import 'package:cyber_bee/presentation/user/single_course/course_view.dart';
import 'package:cyber_bee/presentation/widgets/single_course_tile.dart';
import 'package:flutter/material.dart';

class CourseListView extends StatelessWidget {
  const CourseListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: StreamBuilder<QuerySnapshot<Object?>>(
        stream: GetAllCourseDetails.getCourses(),
        builder: (context, snapshot) {
          if (snapshot.data == null) return const SizedBox();
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final course = snapshot.data!.docs[index];
              return SingleCourseTile(
                course: course,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseViewScreen(
                      course: course,
                    ),
                  ),
                ),
              );
            },
            itemCount: snapshot.data!.docs.length,
          );
        },
      ),
    );
  }
}
