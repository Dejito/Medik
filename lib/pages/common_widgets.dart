import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(5.0),
      child: Container(
        color: Colors.grey.withOpacity(.5),
        height: 1.0,
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold
      ),
    ),
  );
}
