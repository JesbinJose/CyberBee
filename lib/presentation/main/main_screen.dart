import 'package:cyber_bee/constants/constants.dart';
import 'package:cyber_bee/presentation/course/course.dart';
import 'package:cyber_bee/presentation/home/home.dart';
import 'package:cyber_bee/presentation/profile/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<Widget> screens = [
    const ScreenHome(),
    const CourseScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundBlackColor,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: screens[_currentIndex],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.fromLTRB(40, 0, 40, 40),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              decoration: const BoxDecoration(
                color: MyColors.secondarybackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              width: MediaQuery.sizeOf(context).width * 90,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: const [
                    BottomNavigationBarItem(
                      icon: FaIcon(
                        FontAwesomeIcons.house,
                        size: 19,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: FaIcon(
                        FontAwesomeIcons.book,
                        size: 19,
                      ),
                      label: 'Course',
                    ),
                    BottomNavigationBarItem(
                      icon: FaIcon(
                        FontAwesomeIcons.userTie,
                        size: 19,
                      ),
                      label: 'profile',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
