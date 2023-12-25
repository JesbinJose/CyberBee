import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
import 'package:cyber_bee/presentation/chat/single_chat_screen.dart';
import 'package:cyber_bee/presentation/user/single_course/screens/course_inside.dart';
import 'package:cyber_bee/presentation/widgets/small_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShowPricingPart extends StatelessWidget {
  const ShowPricingPart({
    super.key,
    required this.course,
    required this.controller,
  });
  final DocumentSnapshot course;
  final YoutubePlayerController controller;
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
              function: () {
                controller.pause();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SingleChatScreen(
                      isAdmin: false,
                      userId: UserDetails.userId,
                      userName: 'Contact Us',
                    ),
                  ),
                );
              },
              content: 'Contact Us',
            ),
            k10Width,
            MyCustomSmallButton(
              function: () {
                controller.pause();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseAllPartScreen(
                      course: course,
                    ),
                  ),
                );
              },
              content: 'Enroll Now',
            ),
          ],
        ),
      ),
    );
  }
}
