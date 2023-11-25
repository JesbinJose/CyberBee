import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/courses/courses.dart';
import 'package:cyber_bee/presentation/admin/course/add_course_screens/add_course_screen.dart';
import 'package:cyber_bee/presentation/admin/course/level/add_level_screen.dart';
import 'package:cyber_bee/presentation/admin/widgets/add_custom_widget.dart';
import 'package:flutter/material.dart';

class AdminCourseView extends StatelessWidget {
  const AdminCourseView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: StreamBuilder(
          stream: GetAllCourseDetails.getCourses(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: Text(
                  'There is no Courses',
                ),
              );
            }
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddCourseScreen(),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.textWhiteColor.withOpacity(0.4),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.all(10),
                    width: 120,
                    height: 160,
                    child: const CutomAddButton(),
                  ),
                ),
                ...List.generate(snapshot.data?.docs.length ?? 0, (i) {
                  final course = snapshot.data!.docs[i];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddLevelScreen(
                            courseName: course.id,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.amber,
                      margin: const EdgeInsets.all(10),
                      width: 120,
                      height: 160,
                      child: Center(
                        child: Text(
                          i.toString(),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            );
          },
        ),
      ),
    );
  }
}
