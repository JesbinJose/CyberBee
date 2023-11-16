import 'package:cyber_bee/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backgroundBlackColor,
        appBar: PreferredSize(
          preferredSize: const Size(
            double.infinity,
            250,
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  children: [
                    Text(''),
                    Text(''),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.bell,
                    size: 25,
                    color: MyColors.textRedColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
