
import 'package:cyber_bee/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.size,
    required ValueNotifier<int> currentIndex,
  }) : _currentIndex = currentIndex;

  final Size size;
  final ValueNotifier<int> _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 0, 40, 40),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 60,
      decoration: const BoxDecoration(
        color: MyColors.secondarybackgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      width: size.width * 90,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
          ),
          child: ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (_, __, ___) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: MyColors.primaryRedColor,
                currentIndex: _currentIndex.value,
                onTap: (value) {
                  _currentIndex.value = value;
                },
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: const [
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.house,
                      size: 20,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.book,
                      size: 20,
                    ),
                    label: 'Course',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.userTie,
                      size: 20,
                    ),
                    label: 'profile',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
