import 'package:cyber_bee/constants/assets_image.dart';
import 'package:cyber_bee/constants/my_colors.dart';
import 'package:cyber_bee/constants/widgets.dart';
import 'package:cyber_bee/presentation/starter/widgets/custom_button.dart';
import 'package:cyber_bee/presentation/starter/widgets/custom_slider.dart';
import 'package:flutter/material.dart';

class StarterFirstScreen extends StatefulWidget {
  const StarterFirstScreen({super.key});

  @override
  State<StarterFirstScreen> createState() => _StarterFirstScreenState();
}

class _StarterFirstScreenState extends State<StarterFirstScreen> {
  final int pageNo = 1;
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundBlackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ratioSize(1),
            if (_counter == 0)
              CustomStarterPageWidget(
                value: 0,
                image: MyAssetsImages.starterFirstImage,
                title: 'Explore your \nnew skills today',
                thought: 'You can learn various kinds of\ncourses in CyberBee',
              ),
            if (_counter == 1)
              CustomStarterPageWidget(
                value: 1,
                image: MyAssetsImages.starterSecondImage,
                title: 'Empower your\nskills to next level',
                thought: 'Learn new things and develop your\ntechnical skills ',
              ),
            ratioSize(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCustomButton(
                  function: () {
                    if (_counter == 0) {
                      _counter = 1;
                      setState(() {});
                    } else {
                      Navigator.pushReplacementNamed(context, 'home');
                    }
                  },
                  text: 'Next',
                ),
                MyCustomButton(
                  function: () {
                    Navigator.pushReplacementNamed(context, 'home');
                  },
                  text: 'Skip',
                ),
              ],
            ),
            ratioSize(2),
          ],
        ),
      ),
    );
  }
}
