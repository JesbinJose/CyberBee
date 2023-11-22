import 'package:cyber_bee/constants/text_styles.dart';
import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
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
        child: StreamBuilder(
          stream: UserDetails.getAllCourseInProgress(),
          builder: (context, snapshot) {
            if (snapshot.data == null|| snapshot.data!.docs.isEmpty) {
              return  Center(
                child: Text(
                  'There is no on progress courses .\nYou need to buy to get courses',
                  style: MyTextStyles.h4,
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
