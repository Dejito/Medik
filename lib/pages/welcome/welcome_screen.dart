import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                children: [
                  SizedBox(
                    width: 345.w,
                    height: 345.w,
                    child: Text(
                      "Image One",
                    ),
                  ),
                  Container(
                    child: Text("See First Learning!",
                      style: TextStyle(
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                  Container(
                    width: 375.w,
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      "Forget about a for apple in two learning",
                      style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                        fontSize: 14.sp,

                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                  child: DotsIndicator(
                dotsCount: 3,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
