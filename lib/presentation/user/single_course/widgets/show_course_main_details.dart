import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/presentation/user/single_course/widgets/bottom_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SingleCourseMainWidget extends StatefulWidget {
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
  final DocumentSnapshot<Object?> course;

  @override
  State<SingleCourseMainWidget> createState() => _SingleCourseMainWidgetState();
}

class _SingleCourseMainWidgetState extends State<SingleCourseMainWidget> {
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                      margin: widget.size.width < widget.size.height
                          ? const EdgeInsets.fromLTRB(0, 10, 0, 30)
                          : null,
                      width: MediaQuery.sizeOf(context).width * .9,
                      height:
                          widget.size.width < widget.size.height ? 200 : widget.size.height * .95,
                      decoration: const BoxDecoration(
                        color: MyColors.secondaryGreyColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: ValueListenableBuilder(
                          valueListenable: widget.isdispose,
                          builder: (context, v, _) {
                            if (!v) return const SizedBox();
                            return YoutubePlayer(
                              controller: widget.controller,
                              showVideoProgressIndicator: true,
                            );
                          })),
                  if (widget.size.width < widget.size.height)
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .9,
                      child: Text(
                        widget.course['description'],
                        style: MyTextStyles.h4.copyWith(
                          color: const Color.fromARGB(162, 253, 255, 255),
                        ),
                      ),
                    ),
                  if (widget.size.width < widget.size.height)
                    const SizedBox(
                      height: 60,
                    ),
                ],
              ),
            ),
          ),
        ),
        if (widget.size.width < widget.size.height)
          ShowPricingPart(
            course: widget.course,
            controller: widget.controller,
          ),
      ],
    );
  }
}
