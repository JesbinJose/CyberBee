
import 'package:cyber_bee/constants/my_colors.dart';
import 'package:cyber_bee/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsTileWidget extends StatelessWidget {
  final String title;
  final Widget widget;
  final IconData icon;
  const SettingsTileWidget({
    super.key,
    required this.title,
    required this.widget,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FaIcon(
        icon,
        color: MyColors.textWhiteColor,
      ),
      title: Text(
        title,
        style: MyTextStyles.h3,
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      ),
    );
  }
}