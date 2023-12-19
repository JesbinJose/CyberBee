import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowLevelWdget extends StatelessWidget {
  ShowLevelWdget({
    super.key,
    required this.course,
  });

  final QueryDocumentSnapshot<Object?> course;

  ValueNotifier<String> level = ValueNotifier('001');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 41, 42, 43),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              20,
            ),
          ),
        ),
        child: Column(
          children: [
            StreamBuilder(
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
            ),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
