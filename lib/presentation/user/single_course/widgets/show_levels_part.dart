
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ShowLevelsPart extends StatelessWidget {
  const ShowLevelsPart({
    super.key,
    required this.course,
    required this.level,
  });

  final QueryDocumentSnapshot<Object?> course;
  final ValueNotifier<String> level;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: course.reference.collection('levels').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data == null) return const SizedBox();
        final data = snapshot.data!.docs.reversed.toList();
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final level = data[index];
            return InkWell(
              onTap: () {
                this.level.value = level.id;
              },
              child: SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    level['level_name'],
                    style: MyTextStyles.h3.copyWith(
                      color: Colors.white60,
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          itemCount: data.length > 5 ? 5 : data.length,
        );
      },
    );
  }
}

