
import 'dart:io';

import 'package:cyber_bee/application/profile/pick_image.dart';
import 'package:cyber_bee/constants/my_colors.dart';
import 'package:cyber_bee/constants/text_styles.dart';
import 'package:cyber_bee/constants/widgets.dart';
import 'package:cyber_bee/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PickImageControll extends StatelessWidget {
  const PickImageControll({
    super.key,
    required ValueNotifier<String> intoImageLink,
  }) : _intoImageLink = intoImageLink;

  final ValueNotifier<String> _intoImageLink;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        k10Width,
        ValueListenableBuilder(
            valueListenable: _intoImageLink,
            builder: (___, _, __) {
              if (_intoImageLink.value.isEmpty) {
                return Center(
                  child: Text(
                    'No Images are selected',
                    style: MyTextStyles.h5,
                  ),
                );
              }
              return Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: circleRad(
                    20,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: circleRad(
                    20,
                  ),
                  child: Image.file(
                    File(
                      _intoImageLink.value,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
        ratioSize(1),
        MyCustomButton(
          function: () =>
              PickProfilePicture.pickImage(context).then(
            (value) {
              if (value != null) {
                _intoImageLink.value = value.path;
              }
            },
          ),
          text: 'Pick Thumbnail',
          color: MyColors.iconPrimaryGreyColor,
        ),
      ],
    );
  }
}
