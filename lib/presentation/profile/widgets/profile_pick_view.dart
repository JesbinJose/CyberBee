
import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/constants.dart';

class ProfilePicView extends StatelessWidget {
  const ProfilePicView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: MyColors.backgroundBlackColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            150,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            150,
          ),
        ),
        child: Center(
          child: FutureBuilder(
            future: UserDetails.getProfilePicLink(),
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                return Image.network(
                  snapshot.data!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                );
              }
              return FaIcon(
                FontAwesomeIcons.circleUser,
                size: 180,
                color: MyColors.iconSecondarywhiteColor.withOpacity(0.7),
              );
            },
          ),
        ),
      ),
    );
  }
}
