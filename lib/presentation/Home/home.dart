import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/presentation/home/widgets/event_carosal.dart';
import 'package:cyber_bee/presentation/home/widgets/my_search_bar.dart';
import 'package:cyber_bee/presentation/home/widgets/recommended_home.dart';
import 'package:cyber_bee/presentation/home/widgets/top_details.dart';
import 'package:cyber_bee/presentation/widgets/custom_title_text.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                k10Height,
                const HomeTopDetails(),
                k30Height,
                k10Height,
                const MySearchBar(),
                k10Height,
                const CustomTitleTextWidget(title: 'Recommended',),
                const RecommendedHome(),
                const CustomTitleTextWidget(title: 'Events',),
                k10Height,
                HomeEventCarosal(),
              ],
            ),
          )
        ),
      ),
    );
  }
}
