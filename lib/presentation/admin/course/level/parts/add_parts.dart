import 'package:cyber_bee/core/firebase/courses/courses.dart';
import 'package:cyber_bee/presentation/admin/course/level/parts/add_part_with_details.dart';
import 'package:cyber_bee/presentation/admin/widgets/add_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../constants/constants.dart';

class AddPartsScreen extends StatelessWidget {
  const AddPartsScreen({
    super.key,
    required this.courseName,
    required this.levelNo,
  });
  final String courseName;
  final String levelNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_forever,
            ),
          ),
          k10Width,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: StreamBuilder(
          stream: GetAllCourseDetails.getAllParts(courseName, levelNo),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Lottie.asset(MyAssetsLottie.loadingList);
            }
            return Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final part = snapshot.data!.docs[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      margin: const EdgeInsets.all(4),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: MyColors.secondaryGreyColor,
                        borderRadius: circleRad(10),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          part['part_name'],
                          style: MyTextStyles.h3,
                        ),
                      ),
                    );
                  },
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPartToLevelInputScreen(
                          course: courseName,
                          levelNo: levelNo,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(4),
                    height: 100,
                    decoration: BoxDecoration(
                      color: MyColors.secondaryGreyColor,
                      borderRadius: circleRad(10),
                    ),
                    child: const Center(
                      child: CutomAddButton(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
