import 'package:flutter/material.dart';
import '../home_screen/home_screen.dart';
import '../../common/constants/fonts.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/images.dart';
import '../assets_screen/assest_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../support_screen/support_screen.dart';

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
      bottomNavigationBar: Container(
        width: media.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xfff9f9f9),
              spreadRadius: 5,
              blurRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: BottomNavigationBar(
            elevation: 0.0,
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
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(Images.homeImage),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Images.dashboardImage)),
                label: 'Assets',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Images.callCenterImage)),
                label: 'Support',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Images.personImage)),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
