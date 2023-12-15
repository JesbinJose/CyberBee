
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/presentation/user/single_course/widgets/bottom_part.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SingleCourseMainWidget extends StatelessWidget {
  const SingleCourseMainWidget({
    super.key,
    required this.size,
    required this.isdispose,
    required this.controller,
    required this.course,
  });

  final Size size;
  final ValueNotifier<bool> isdispose;
  final YoutubePlayerController controller;
  final QueryDocumentSnapshot<Object?> course;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Container(
                    margin: size.width < size.height
                        ? const EdgeInsets.fromLTRB(0, 10, 0, 30)
                        : null,
                    width: MediaQuery.sizeOf(context).width * .9,
                    height: size.width < size.height ? 200 : size.height * .95,
                    decoration: const BoxDecoration(
                      color: MyColors.secondaryGreyColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                    ),
                    child: ValueListenableBuilder(
                        valueListenable: isdispose,
                        builder: (context, v, _) {
                          if (!v) return const SizedBox();
                          return YoutubePlayer(
                            controller: controller,
                            showVideoProgressIndicator: true,
                          );
                        })),
                if (size.width < size.height)
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .9,
                    child: Text(
                      course['description'],
                      style: MyTextStyles.h4.copyWith(
                        color: const Color.fromARGB(162, 253, 255, 255),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (size.width < size.height)
          ShowPricingPart(
            course: course,
          ),
      ],
    );
  }
}
