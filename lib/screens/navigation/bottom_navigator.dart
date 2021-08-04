import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnTapFunction = Function(int index);

class BottomNavigator extends StatelessWidget {

  final int pageIndex;
  final OnTapFunction onTap;

  const BottomNavigator({required this.pageIndex, required this.onTap});

  BottomNavigationBarItem barItem ({
    required String pageName,
    required IconData icon,
    required IconData activeIcon,
  }) {
    return BottomNavigationBarItem(
      icon: AppLibScreen.appIcon(icon: icon,),
      activeIcon: AppLibScreen.appIcon(icon: activeIcon,),
      label: pageName,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 0,
      currentIndex: pageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      items: <BottomNavigationBarItem>[
        barItem(
          icon: Icons.home_outlined,
          activeIcon: Icons.home,
          pageName: S.current.homepage,
        ),
        barItem(
          icon: Icons.search_outlined,
          activeIcon: Icons.search,
          pageName: S.current.search,
        ),
        barItem(
          icon: Icons.favorite_outline_sharp,
          activeIcon: Icons.favorite_sharp,
          pageName: S.current.favorite,
        ),
        barItem(
          icon: Icons.notifications_outlined,
          activeIcon: Icons.notifications,
          pageName: S.current.notification,
        ),
        barItem(
          icon: Icons.person_outline,
          activeIcon: Icons.person,
          pageName: S.current.personalInfo,
        ),
      ],
    );
  }
}