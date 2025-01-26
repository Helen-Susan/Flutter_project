import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical/screens/doc.dart';
import 'package:medical/screens/medical_dosage.dart';
import 'package:medical/screens/pharmacy.dart';
import 'package:medical/screens/profilepage.dart';
import 'package:medical/screens/settings.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      MedicalDosage(),
      FilePickerDemo(),
      ProfilePage(),
      PharmacyScreen(),
      Setting()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Medical Dosage"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Documentss"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Profile"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Pharmacy"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      /* popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,*/
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Colors.grey.shade900,
      isVisible: true,
      /*animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings( // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                duration: Duration(milliseconds: 200),
                screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
            ),
        ),*/
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property
    ));
  }
}
