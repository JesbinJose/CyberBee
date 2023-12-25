import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/text_styles.dart';
import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
import 'package:cyber_bee/presentation/user/single_course/screens/front_course_view.dart';
import 'package:cyber_bee/presentation/widgets/single_course_tile.dart';
import 'package:flutter/material.dart';

class CustomCourseView extends StatelessWidget {
  const CustomCourseView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FutureBuilder(
          future: UserDetails.getCoursesInprogress(UserDetails.userId),
          builder: (context, snapshot) {
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'There is no on progress courses .\nYou need to buy to get courses',
                  style: MyTextStyles.h4,
                ),
              );
            }
            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final DocumentReference docs = snapshot.data![index];
                return FutureBuilder<DocumentSnapshot>(
                  future: docs.get(),
                  builder: (context, s) {
                    if (s.data == null) return const SizedBox();
                    return SingleCourseTile(
                      course: s.data!,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseViewScreen(
                            course: s.data!,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 20,
                );
              },
              itemCount: snapshot.data!.length,
            );
          },
        ),
      ),
    );
  }
}
