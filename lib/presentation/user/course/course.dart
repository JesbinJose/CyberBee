import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
import 'package:cyber_bee/presentation/user/course/widgets/course_progress_part.dart';
import 'package:cyber_bee/presentation/user/course/widgets/course_view_widget.dart';
import 'package:cyber_bee/presentation/widgets/custom_button.dart';
import 'package:cyber_bee/presentation/widgets/custom_title_text.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              k30Height,
              const CourseProgressContainerWidget(),
              k20Height,
              const CustomTitleTextWidget(title: 'Course in progress'),
              const CustomCourseView(),
              const CustomTitleTextWidget(title: 'My Certificates'),
              k10Height,
              Container(
                decoration: const BoxDecoration(
                  color: MyColors.secondaryGreyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 150,
                child: StreamBuilder(
                  stream: UserDetails.getAllCertificate(),
                  builder: (context, snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (snapshot.data==null||snapshot.data!.docs.isEmpty)
                        Text(
                          'No certificates obtained till now',
                          style: MyTextStyles.h4,
                        ),
                        if (snapshot.data==null||snapshot.data!.docs.isEmpty)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MyCustomButton(
                              function: () {},
                              text: 'Get Certificate',
                            ),
                          ],
                        ),
                        if(snapshot.data!=null&&snapshot.data!.docs.isNotEmpty)
                        Container(),
                      ],
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}