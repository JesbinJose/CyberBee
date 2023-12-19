import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/text_styles.dart';
import 'package:cyber_bee/presentation/user/single_course/screens/single_part_screen.dart';
import 'package:flutter/material.dart';

class SinglePartWidget extends StatelessWidget {
  const SinglePartWidget({
    super.key,
    required this.part,
  });

  final QueryDocumentSnapshot<Map<String, dynamic>> part;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SinglePartScreen(part: part),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Text(
          part['partName'],
          style: MyTextStyles.h3,
        ),
      ),
    );
  }
}
