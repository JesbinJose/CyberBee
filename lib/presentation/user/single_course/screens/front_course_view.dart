import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/presentation/user/single_course/widgets/show_course_main_details.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class CourseViewScreen extends StatelessWidget {
  CourseViewScreen({super.key, required this.course});
  final QueryDocumentSnapshot course;
  final ValueNotifier<bool> isdispose = ValueNotifier(true);
  late YoutubePlayerController controller;

  void exitPage(BuildContext context) async {
    isdispose.value = false;
    await Future.delayed(const Duration(milliseconds: 200)).then((_) {
      Navigator.pop(context);
      controller.dispose();
    });
  }

  String extractVideoId(String url) =>
      url.substring(url.lastIndexOf('?v=') + 3);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final String videoId = extractVideoId(course['intro_video']);
    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    controller.load(videoId);
    return Scaffold(
      appBar: size.width < size.height
          ? AppBar(
              title: Text(
                course.id,
              ),
              leading: IconButton(
                onPressed: () => exitPage(context),
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
            )
          : null,
      body: SingleCourseMainWidget(
        size: size,
        isdispose: isdispose,
        controller: controller,
        course: course,
      ),
    );
  }
}
