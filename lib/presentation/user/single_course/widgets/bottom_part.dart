import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/presentation/user/single_course/screens/course_inside.dart';
import 'package:cyber_bee/presentation/widgets/small_custom_button.dart';
import 'package:flutter/material.dart';

class ShowPricingPart extends StatelessWidget {
  const ShowPricingPart({
    super.key,
    required this.course,
  });
  final QueryDocumentSnapshot course;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 60,
        decoration: const BoxDecoration(
          color: MyColors.secondaryGreyColor,
          borderRadius: BorderRadiusDirectional.vertical(
            top: Radius.circular(15),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            const Spacer(),
            MyCustomSmallButton(
              function: () {},
              content: 'Contact Us',
            ),
            k10Width,
            MyCustomSmallButton(
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseAllPartScreen(
                    course: course,
                  ),
                ),
              ),
              content: 'Enroll Now',
            ),
          ],
        ),
      ),
    );
  }
}