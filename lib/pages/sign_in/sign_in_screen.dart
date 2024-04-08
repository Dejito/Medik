import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medik/pages/sign_in/sign_in_widgets.dart';

class SignInScreen extends StatelessWidget {
  static const route = "sign_in_screen";

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Container(
        child: SafeArea(
            child: Scaffold(
          appBar: buildAppBar(),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(),
                Center(
                  child: reusableText("Or use email account to login"),
                ),
                reusableText("Email"),
                buildTextField()
              ],
            ),
          ),
        )),
      ),
    );
  }
}
