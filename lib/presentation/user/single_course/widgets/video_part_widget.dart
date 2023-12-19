
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/text_styles.dart';
import 'package:cyber_bee/constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPartScreen extends StatelessWidget {
  const VideoPartScreen({
    super.key,
    required this.part,
    required this.controller,
  });

  final QueryDocumentSnapshot<Map<String, dynamic>> part;
  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: s.height > s.width ? AppBar(title: Text(part['partName'])) : null,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            YoutubePlayer(controller: controller),
            if (s.height > s.width) k20Height,
            if (s.height > s.width)
              SizedBox(
                width: double.infinity,
                child: Text(
                  part['description'],
                  style: MyTextStyles.h4.copyWith(
                    color: Colors.white54,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
