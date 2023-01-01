import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/values/colors.dart';

AppBar settingAppBar() {
  return AppBar(
    title: Text(
      'Settings',
      style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp),
    ),
  );
}

Widget logoutButton(BuildContext context, Function() func ) {
  return InkWell(
    onTap: () {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Confirm Logout'),
              content: const Text('Sure to logout?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => func,
                  child: const Text('Confirm'),
                ),
              ],
            );
          });
    },
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/icons/Logout.png'),
        ),
      ),
    ),
  );
}
