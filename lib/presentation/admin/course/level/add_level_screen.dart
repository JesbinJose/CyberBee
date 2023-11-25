import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/courses/courses.dart';
import 'package:cyber_bee/presentation/admin/course/level/parts/add_parts.dart';
import 'package:cyber_bee/presentation/admin/course/widgets/custom_dialog_add_level.dart';
import 'package:cyber_bee/presentation/admin/widgets/add_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AddLevelScreen extends StatelessWidget {
  final String courseName;
  const AddLevelScreen({
    super.key,
    required this.courseName,
  });

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
          stream: GetAllCourseDetails.getAllLevels(courseName),
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
                    final level = snapshot.data!.docs[index];
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddPartsScreen(
                            courseName: courseName,
                            levelNo: level.id,
                          ),
                        ),
                      ),
                      child: Container(
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
                            level['level_name'],
                            style: MyTextStyles.h3,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => LevelDetailsGettingDialoge(
                        courseName: courseName,
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
