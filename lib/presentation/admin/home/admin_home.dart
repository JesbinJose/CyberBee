import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/constants/widgets.dart';
import 'package:cyber_bee/presentation/admin/home/widgets/cotent_admin_part.dart';
import 'package:cyber_bee/presentation/admin/widgets/admin_top_view.dart';
import 'package:cyber_bee/presentation/widgets/custom_title_text.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTopViewForAdmin(),
                const CustomTitleTextWidget(
                  title: 'Content',
                ),
                k10Height,
                AdminEventCarosal(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
