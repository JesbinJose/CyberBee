import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/presentation/home/widgets/top_details.dart';
import 'package:cyber_bee/presentation/search/search.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backgroundBlackColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.sizeOf(context).height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HomeTopDetails(),
                SearchBar(
                  onTap: ()=>showSearch(context: context, delegate: Search(),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


