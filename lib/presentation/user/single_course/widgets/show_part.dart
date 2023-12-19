import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/text_styles.dart';
import 'package:cyber_bee/presentation/user/single_course/widgets/single_part_widget.dart';
import 'package:flutter/material.dart';

class ShowPartsWidget extends StatelessWidget {
  const ShowPartsWidget({
    super.key,
    required this.level,
    required this.course,
  });

  final ValueNotifier<String> level;
  final QueryDocumentSnapshot<Object?> course;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white30,
      ),
      child: ValueListenableBuilder(
        valueListenable: level,
        builder: (context, v, _) {
          return StreamBuilder(
            stream: course.reference
                .collection('levels')
                .doc(level.value)
                .collection('parts')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final part = snapshot.data!.docs[index];
                    return SinglePartWidget(part: part);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    thickness: 2,
                    color: Color.fromARGB(62, 0, 0, 0),
                  ),
                  itemCount: snapshot.data!.docs.length,
                );
              }
              return SizedBox(
                height: 200,
                child: Center(
                  child: Text(
                    'No parts Added',
                    style: MyTextStyles.h3,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
