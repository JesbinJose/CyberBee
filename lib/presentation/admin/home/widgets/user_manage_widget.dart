import 'package:cyber_bee/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomUserManageTile extends StatelessWidget {
  final IconData icon;
  final String userType;
  final Widget screen;
  const CustomUserManageTile({
    super.key,
    required this.icon,
    required this.userType,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      ),
      child: SizedBox(
        height: 140,
        width: 100,
        child: Column(
          children: [
            FaIcon(
              icon,
              color: MyColors.iconSecondarywhiteColor,
              size: 90,
            ),
            k20Height,
            Text(
              userType,
              style: MyTextStyles.h4,
            ),
          ],
        ),
      ),
    );
  }
}
