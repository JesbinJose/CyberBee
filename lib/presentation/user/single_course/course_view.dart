import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/constants.dart';
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
    setState(() {
      controller = YoutubePlayerController(
        initialVideoId: extractVideoId(widget.course['intro_video']),
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );
    });
    loadVideo();

    super.initState();
  }

  loadVideo() {
    controller.load('pWJojmHLDFM');
  }

  String extractVideoId(String url) {
    return url.substring(
      url.lastIndexOf('?v=') + 3,
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
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
      body: Padding(
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
    );
  }
}
