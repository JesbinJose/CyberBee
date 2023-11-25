import 'dart:io';

import 'package:cyber_bee/constants/my_colors.dart';
import 'package:cyber_bee/constants/text_styles.dart';
import 'package:cyber_bee/constants/widgets.dart';
import 'package:flutter/material.dart';

class CustomImagePreview extends StatelessWidget {
  const CustomImagePreview({
    super.key,
    required this.image,
  });

  final ValueNotifier<String?> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .9,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: circleRad(20),
        border: Border.all(
          color: MyColors.iconSecondarywhiteColor,
          width: 2,
        ),
      ),
      child: ValueListenableBuilder<String?>(
        valueListenable: image,
        builder: (__, d, _) {
          if (d != null) {
            return ClipRRect(
              borderRadius: circleRad(19),
              child: Image.file(
                File(d),
                fit: BoxFit.cover,
              ),
            );
          } else {
            return Center(
              child: Text(
                'No image selected',
                style: MyTextStyles.h5,
              ),
            );
          }
        },
      ),
    );
  }
}
