import 'package:cyber_bee/core/firebase/courses/courses.dart';
import 'package:flutter/material.dart';

class RecommendedHome extends StatelessWidget {
  const RecommendedHome({
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
                  'There is no recomended Courses',
                ),
              );
            }
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  snapshot.data?.docs.length ?? 0,
                  (i) => Container(
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
