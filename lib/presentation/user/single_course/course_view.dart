import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/presentation/user/single_course/widgets/bottom_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseViewScreen extends StatefulWidget {
  const CourseViewScreen({super.key, required this.course});
  final QueryDocumentSnapshot course;

  @override
  State<CourseViewScreen> createState() => _CourseViewScreenState();
}

class _CourseViewScreenState extends State<CourseViewScreen> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    final String videoId = extractVideoId(widget.course['intro_video']);
    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    controller.load(videoId);
    super.initState();
  }

  String extractVideoId(String url) =>
      url.substring(url.lastIndexOf('?v=') + 3);

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: size.width < size.height
          ? AppBar(
              title: Text(
                widget.course.id,
              ),
            )
          : null,
      body: Stack(
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
                    child: YoutubePlayer(
                      controller: controller,
                      showVideoProgressIndicator: true,
                    ),
                  ),
                  if (size.width < size.height)
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .9,
                      child: Text(
                        widget.course['description'],
                        style: MyTextStyles.h4.copyWith(
                          color: const Color.fromARGB(162, 253, 255, 255),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const ShowPricingPart(),
        ],
      ),
    );
  }
}
