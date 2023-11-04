import 'package:flutter/material.dart';
import 'package:services_app/common/constants/colors.dart';
import 'package:services_app/common/constants/images.dart';
import 'package:services_app/pages/assets_screen/assest_screen.dart';
import 'package:services_app/pages/profile_screen/profile_screen.dart';
import 'package:services_app/pages/support_screen/support_screen.dart';

import '../../common/constants/fonts.dart';
import '../home_screen/home_screen.dart';

class BottomNavigationBarScreens extends StatefulWidget {
  const BottomNavigationBarScreens({super.key});

  @override
  State<BottomNavigationBarScreens> createState() =>
      _BottomNavigationBarScreensState();
}

class _BottomNavigationBarScreensState
    extends State<BottomNavigationBarScreens> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (value) {
          currentIndex = value;
          setState(() {});
        },
        children: [
          HomeScreen(media: media),
          const AssetsScreen(),
          const SupportScreen(),
          const ProfileScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffffffff),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          pageController.animateToPage(value,
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear);
        },
        selectedLabelStyle:
            Fonts.defaultFont.copyWith(fontWeight: FontWeight.w400),
        selectedItemColor: AppColors.mainColor,
        selectedIconTheme: const IconThemeData(color: AppColors.mainColor),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              Images.homeImage,
              height: media.height * .035,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Images.dashboardImage,
              height: media.height * .035,
            ),
            label: 'Assets',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Images.callCenterImage,
              height: media.height * .035,
            ),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Images.personImage,
              height: media.height * .035,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
