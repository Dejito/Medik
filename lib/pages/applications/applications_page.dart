import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medik/pages/applications/applications_widget.dart';
import 'package:medik/pages/sign_in/sign_in_widgets.dart';

import '../../common/values/colors.dart';

class ApplicationPage extends StatefulWidget {

  static const id = "application_page";

  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryFourElementText,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (int value) {
              // appBLoC.add(TriggerAppEvent(value));
              setState(() {
                selectedIndex = value;
              });
            },
            items: bottomNavBars,
          ),
        ),
      ),
    );
  }
}
