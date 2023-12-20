import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
import 'package:cyber_bee/presentation/profile/widgets/profile_options.dart';
import 'package:cyber_bee/presentation/profile/widgets/profile_pick_view.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final bool isInAdminPanel;
  const ProfileScreen({
    super.key,
    this.isInAdminPanel = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  color: MyColors.primaryRedColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      150,
                    ),
                  ),
                ),
                child: const ProfilePicView(),
              ),
              k10Height,
              FutureBuilder<String>(
                future: UserDetails.getUsername(),
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data ?? '',
                    style: MyTextStyles.h1.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  );
                },
              ),
              k30Height,
              SettingOptions(isInAdminPanel: isInAdminPanel),
            ],
          ),
        ),
      ),
    );
  }
}
