
import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/core/firebase/user_details/user_details.dart';
import 'package:cyber_bee/core/starter_controls/starter_controller.dart';
import 'package:cyber_bee/presentation/admin/course/admin_course.dart';
import 'package:cyber_bee/presentation/admin/home/admin_home.dart';
import 'package:cyber_bee/presentation/auth/login/login_screen.dart';
import 'package:cyber_bee/presentation/main/main_screen.dart';
import 'package:cyber_bee/presentation/notification/notifications.dart';
import 'package:cyber_bee/presentation/profile/profile.dart';
import 'package:cyber_bee/presentation/profile/screens/account_settings.dart';
import 'package:cyber_bee/presentation/profile/widgets/single_setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({
    super.key,
    required this.isInAdminPanel,
  });

  final bool isInAdminPanel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            widget: NotificationScreen(),
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
              showDialog(
                context: context,
                builder: (_) => SimpleDialog(
                  title: const Text(
                    'Do you want to logout',
                  ),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'No',
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
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
                          child: const Text(
                            'Yes',
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
