import 'package:drivevn/core/constants/app_color.dart';
import 'package:drivevn/core/constants/icon_path.dart';
import 'package:drivevn/feature/home/home_screen.dart';
import 'package:drivevn/feature/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) => setState(() {
            currentIndex = value;
          }),
          showUnselectedLabels: false,
          backgroundColor: AppColor.background,
          selectedItemColor: Colors.orange,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                IconPath.home,
                width: 24,
                height: 24,
              ),
              activeIcon: SvgPicture.asset(
                IconPath.home,
                width: 24,
                height: 24,
                color: Colors.orange,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                IconPath.setting,
                width: 24,
                height: 24,
              ),
              activeIcon: SvgPicture.asset(
                IconPath.setting,
                width: 24,
                height: 24,
                color: Colors.orange,
              ),
              label: 'setting',
            ),
          ],
        ),
        body: _screens[currentIndex],
      ),
    );
  }
}
