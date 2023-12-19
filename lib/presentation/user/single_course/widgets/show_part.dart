
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/text_styles.dart';
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
      height: 300,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
              if (snapshot.data != null) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final part = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Text(
                        part['partName'],
                        style: MyTextStyles.h3,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    thickness: 2,
                    color: Color.fromARGB(62, 0, 0, 0),
                  ),
                  itemCount: snapshot.data!.docs.length,
                );
              }
              return const Center(
                child: Text(
                  'No parts Added',
                ),
              );
            },
          );
        },
      ),
    );
  }
}