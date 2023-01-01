import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medik/pages/home/homepage.dart';
import 'package:medik/pages/profile/profile_page.dart';

import '../../common/values/colors.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
     const HomePageScreen(),
    const Center( child:  Text('Search')),
    const Center( child:  Text('Course')),
    const Center( child:  Text('Chat')),
    const ProfilePage()
  ];
  return widget[index];
}

var bottomNavBars = [
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.h, width: 15.w,
      child: Image.asset('assets/icons/home.png',
      ),
    ),
    label: 'Home',
    activeIcon: SizedBox(
      height: 15.h, width: 15.w,
      child: Image.asset('assets/icons/home.png',
        color: AppColors.primaryElement,
      ),
    ),
    // backgroundColor:
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.h, width: 15.w,
      child: Image.asset('assets/icons/search2.png',
      ),
    ),
    label: 'Home',
    activeIcon: SizedBox(
      height: 15.h, width: 15.w,
      child: Image.asset('assets/icons/search2.png',
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.h, width: 15.w,
      child: Image.asset('assets/icons/play-circle1.png'),
    ),
    label: 'Home',
    activeIcon: SizedBox(
      height: 15.h, width: 15.w,
      child: Image.asset('assets/icons/play-circle1.png',
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.h, width: 15.w,
      child: Image.asset('assets/icons/message-circle.png',
      ),
    ),
    label: 'Home',
    activeIcon: SizedBox(
      height: 15.h, width: 15.w,
      child: Image.asset('assets/icons/message-circle.png',
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 15.h, width: 15.w,
      child: Image.asset('assets/icons/person2.png',
      ),
    ),
    label: 'Home',
    activeIcon: SizedBox(
      height: 15.h, width: 15.w,
      child: Image.asset('assets/icons/person2.png',
        color: AppColors.primaryElement,
      ),
    ),
  ),
];