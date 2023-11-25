import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/details/user_details.dart';
import 'package:cyber_bee/presentation/admin/manage/widgets/add_button.dart';
import 'package:cyber_bee/presentation/admin/manage/widgets/student_tile.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ManageStudent extends StatelessWidget {
  const ManageStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        actions: [
          AddButtonAdmin(function: () {}),
          k30Width,
        ],
      ),
      body: FutureBuilder(
        future: UserDetailsForAdmin.getAllStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Lottie.asset(
              MyAssetsLottie.loadingList,
              width: 300,
            );
          }
          if (snapshot.data == null) return const SizedBox.shrink();
          return Column(
            children: [
              k30Height,
              ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final user = snapshot.data![index];
                  return SingleStudentTile(
                    user: user,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
