import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
import 'package:cyber_bee/core/starter_controls/starter_controller.dart';
import 'package:cyber_bee/presentation/admin/course/admin_course.dart';
import 'package:cyber_bee/presentation/admin/home/admin_home.dart';
import 'package:cyber_bee/presentation/auth/login/login_screen.dart';
import 'package:cyber_bee/presentation/main/main_screen.dart';
import 'package:cyber_bee/presentation/profile/screens/account_settings.dart';
import 'package:cyber_bee/presentation/profile/screens/notification_settings.dart';
import 'package:cyber_bee/presentation/profile/widgets/profile_pick_view.dart';
import 'package:cyber_bee/presentation/profile/widgets/single_setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  final bool isInAdminPanel;
  const ProfileScreen({
    super.key,
    this.isInAdminPanel = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ratioSize(1),
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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: (MediaQuery.sizeOf(context).width - 300) / 2,
            ),
            child: Column(
              children: [
                const SettingsTileWidget(
                  title: 'Account settings',
                  icon: FontAwesomeIcons.userTie,
                  widget: UserAccountSettingsScreen(),
                ),
                const SettingsTileWidget(
                  title: 'Notifications',
                  icon: FontAwesomeIcons.bell,
                  widget: UserNotificationSettingsScreen(),
                ),
                if (!isInAdminPanel)
                  FutureBuilder(
                    future: UserDetails.isadmin(),
                    builder: (context, snapshot) {
                      if (snapshot.data != null && snapshot.data!) {
                        return SettingsTileWidget(
                          title: 'Admin Panel',
                          icon: FontAwesomeIcons.shieldHalved,
                          widget: MainScreen(
                            screens: const [
                              AdminHomeScreen(),
                              AdminCourseScreen(),
                              ProfileScreen(
                                isInAdminPanel: true,
                              ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ListTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.arrowRightFromBracket,
                    color: MyColors.textWhiteColor,
                  ),
                  title: Text(
                    'Logout',
                    style: MyTextStyles.h3,
                  ),
                  onTap: () async {
                    Navigator.popUntil(
                      context,
                      (route) => route.isFirst,
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                    await StarterControl.logout();
                  },
                ),
              ],
            ),
          ),
          ratioSize(4),
        ],
      ),
    );
  }
}
