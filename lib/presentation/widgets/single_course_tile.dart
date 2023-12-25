import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/my_colors.dart';
import 'package:cyber_bee/constants/text_styles.dart';
import 'package:flutter/material.dart';

class SingleCourseTile extends StatelessWidget {
  const SingleCourseTile({
    super.key,
    required this.course, required this.onTap,
  });

  final DocumentSnapshot<Object?> course;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          color: MyColors.iconPrimaryGreyColor.withOpacity(.2),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              child: Image.network(
                course['intro_image'],
                fit: BoxFit.fill,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              course.id,
              style: MyTextStyles.h5,
            ),
          ],
        ),
      ),
    );
  }
}
