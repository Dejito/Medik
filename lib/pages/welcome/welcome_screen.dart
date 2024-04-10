import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medik/pages/sign_in/sign_in_screen.dart';

import 'bloc/welcome_bloc.dart';

class WelcomeScreen extends StatefulWidget {

  static const route = "welcome_screen";

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<WelcomeBloc>(context);
    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
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
                    controller: _pageController,
                    onPageChanged: (newPosition) {
                      state.position = newPosition;
                      blocProvider.add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        1,
                        context,
                        'next',
                        "First it was fragrance",
                        "And through desire, a man having separateth himself intermingleth with all knowlege!",
                        "assets/images/reading.png",
                      ),
                      _page(
                        2,
                        context,
                        'next',
                        "Connect with everyone",
                        "Then it turned to fire, my worship is my weapon, this is how I win my battles",
                        "assets/images/boy.png",
                      ),
                      _page(
                        3,
                        context,
                        'Get started',
                        "This is how I win",
                        "And through desire, a man having separateth himself intermingleth with all knowlege!",
                        "assets/images/man.png",
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 50.h,
                    left: 130.h,
                    child: DotsIndicator(
                      position: state.position,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue,
                        size: const Size.square(8),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

  }
  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subtitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            subtitle,
            style: TextStyle(
              color: Colors.black.withOpacity(.5),
              fontSize: 14.sp,
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            if (index < 3) {
              _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.linear
              );
            } else {
              Navigator.of(context).pushReplacementNamed(SignInScreen.route);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(1, 0))
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}

