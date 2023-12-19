import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/presentation/user/single_course/screens/pdf_part.dart';
import 'package:cyber_bee/presentation/user/single_course/widgets/video_part_widget.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SinglePartScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> part;
  const SinglePartScreen({super.key, required this.part});

  String extractVideoId(String url) =>
      url.substring(url.lastIndexOf('?v=') + 3);

  @override
  Widget build(BuildContext context) {
    if (part['type'] case 'pdf') {
      return PdfPartScreen(part: part);
    } else {
      final controller = YoutubePlayerController(
        initialVideoId: extractVideoId(part['url']),
      );
      return VideoPartScreen(
        part: part,
        controller: controller,
      );
    }
  }
}
