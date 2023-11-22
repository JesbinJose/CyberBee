import 'package:cyber_bee/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({super.key, required this.value});
  final double value;
  @override
  Widget build(BuildContext context) {
    final double ratio = value > 1 ? 1 : value;
    final double maxWidth = MediaQuery.sizeOf(context).width-30;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      width: maxWidth,
      height: 8,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              color: MyColors.textWhiteColor,
            ),
            width: maxWidth,
            height: 8,
          ),
          Visibility(
            visible: value>0.1,
            child: Container(
              width: maxWidth * ratio -30,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 255, 17, 0),
                  Color.fromARGB(237, 255, 17, 0),
                  Color.fromARGB(171, 255, 17, 0),
                  Color.fromARGB(132, 255, 17, 0),
                ]),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(
                    10,
                  ),
                ),
              ),
              height: 8,
            ),
          ),
        ],
      ),
    );
  }
}
