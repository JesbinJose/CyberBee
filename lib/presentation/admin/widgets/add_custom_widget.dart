import 'package:cyber_bee/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CutomAddButton extends StatelessWidget {
  const CutomAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
          color: MyColors.textWhiteColor,
        ),
        child: FaIcon(
          FontAwesomeIcons.circlePlus,
          size: 50,
          color: MyColors.iconPrimaryGreyColor.withOpacity(
            0.3,
          ),
        ),
      ),
    );
  }
}
