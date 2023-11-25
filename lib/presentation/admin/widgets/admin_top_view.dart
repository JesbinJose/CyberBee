import 'package:cyber_bee/constants/widgets.dart';
import 'package:cyber_bee/presentation/admin/home/widgets/search_bar.dart';
import 'package:cyber_bee/presentation/admin/home/widgets/top_widget.dart';
import 'package:cyber_bee/presentation/admin/home/widgets/user_manage_widget.dart';
import 'package:cyber_bee/presentation/admin/manage/admin.dart';
import 'package:cyber_bee/presentation/admin/manage/student.dart';
import 'package:cyber_bee/presentation/widgets/custom_title_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTopViewForAdmin extends StatelessWidget {
  const CustomTopViewForAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        k10Height,
         AdminHomeTopDetails(),
        k30Height,
        k10Height,
         MyAdminSearchBar(),
        k10Height,
        CustomTitleTextWidget(
          title: 'Manage',
        ),
        SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomUserManageTile(
                icon: FontAwesomeIcons.userGraduate,
                userType: 'Student',
               screen: ManageStudent(),
              ),
              CustomUserManageTile(
                icon: FontAwesomeIcons.shieldHalved,
                userType: 'Admin',
                screen: ManageAdmin(),
              ),
              CustomUserManageTile(
                icon: FontAwesomeIcons.userTie,
                userType: 'Tutor',
                screen: Scaffold(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
