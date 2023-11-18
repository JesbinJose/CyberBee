import 'package:cyber_bee/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key, required this.screens});

  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  final List<Widget> screens;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ValueListenableBuilder<int>(
          valueListenable: _currentIndex,
          builder: (_, __, ___) {
            return screens[_currentIndex.value];
          },
        ),
      ),
      bottomNavigationBar: Container(
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
      ),
    );
  }
}
