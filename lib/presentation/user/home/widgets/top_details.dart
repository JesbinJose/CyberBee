import 'package:cyber_bee/constants/my_colors.dart';
import 'package:cyber_bee/constants/text_styles.dart';
import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeTopDetails extends StatelessWidget {
  const HomeTopDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome !',
              style: MyTextStyles.h1,
            ),
            FutureBuilder<String>(
              future: UserDetails.getUsername(),
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? '',
                  style: MyTextStyles.h1.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 24
                  ),
                );
              },
            ),
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
    );
  }
}