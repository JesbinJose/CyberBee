import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/presentation/widgets/small_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingleStudentTile extends StatelessWidget {
  const SingleStudentTile({
    super.key,
    required this.user,
  });

  final QueryDocumentSnapshot<Object?> user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: MyColors.primaryRedColor,
          borderRadius: circleRad(50),
        ),
        padding: const EdgeInsets.all(2),
        child: CircleAvatar(
          backgroundColor: MyColors.backgroundBlackColor,
          radius: 50,
          child: ClipRRect(
            borderRadius: circleRad(50),
            child: user['profile_pic'] != ''
                ? Image.network(
                    user['profile_pic'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                : FaIcon(
                    FontAwesomeIcons.circleUser,
                    color: MyColors.iconSecondarywhiteColor.withOpacity(
                      0.7,
                    ),
                  ),
          ),
        ),
      ),
      title: Text(
        user['username'],
        style: MyTextStyles.h5.copyWith(
          color: Colors.white,
          fontSize: 14,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Text(
        user.id,
        style: MyTextStyles.h5.copyWith(
          fontSize: 13,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyCustomSmallButton(
            function: () {},
            content: 'Activity',
          ),
          k10Width,
          MyCustomSmallButton(
            function: () {},
            content: 'Update',
          ),
        ],
      ),
    );
  }
}
