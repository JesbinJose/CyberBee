import 'package:cyber_bee/presentation/main/widgets/bottom_nav_bar.dart';
import 'package:cyber_bee/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key, required this.screens});

  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  final List<Widget> screens;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return PopScope(
      onPopInvoked: (didPop) {
        mySnakbar(
          context,
          'Back to User Interface',
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: ValueListenableBuilder<int>(
                valueListenable: _currentIndex,
                builder: (_, __, ___) {
                  return screens[_currentIndex.value];
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavBar(
                size: size,
                currentIndex: _currentIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
