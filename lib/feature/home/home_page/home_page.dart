import 'package:drivevn/core/constants/app_color.dart';
import 'package:drivevn/core/constants/icon_path.dart';
import 'package:drivevn/feature/home/bloc/home_bloc.dart';
import 'package:drivevn/feature/home/home_screen/home_screen.dart';
import 'package:drivevn/feature/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bloc = context.read<HomeBloc>();
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              onTap: (value) => bloc.add(SwitchTabEvent(index: value)),
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
            body: _screens[state.currentIndex],
          ),
        );
      },
    );
  }
}
