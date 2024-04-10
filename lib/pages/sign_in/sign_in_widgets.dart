import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(5.0),
      child: Container(
        color: Colors.grey.withOpacity(.5),
        height: 1.0,
      ),
    ),
    title: const Center(
      child: Text("Login"),
    ),
  );
}

Widget buildThirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(top: 30.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons("google"),
        _reusableIcons("apple"),
        _reusableIcons("facebook"),
      ],
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () => {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h, top: 14.h),
    child: Text(
      text,
      style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName, void Function(String value) onTextChanged) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(top: 3.h),
    decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: Colors.black, width: .5)),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child:  TextField(
            onChanged: (value) => onTextChanged(value),
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
              disabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(.6)
              ),
            ),
            style: const TextStyle(
              fontFamily: "Avenir"
            ),
          ),
        )
        // TextField()
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(top: 15.h),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: const Text(
        "Forgot Password",
        style: TextStyle(
            decoration: TextDecoration.underline, decorationColor: Colors.blue),
      ),
    ),
  );
}


Widget buildLoginAndRegButton(
    String buttonName,
    String buttonType, Function onTap,
    ) {
  return GestureDetector(
    onTap: () {onTap();},
    child: Container(
      width: 350.w,
      height: 50.h,
      margin: EdgeInsets.only(top: buttonType == "login" ? 40.h : 20.h),
      decoration: BoxDecoration(
          color: buttonType == 'login'
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
            color: buttonType == 'login'
                ? Colors.transparent
                : AppColors.primaryFourElementText,
          ),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              color: buttonType == 'login' ? Colors.white : Colors.black,
              fontSize: 16),
        ),
      ),
    ),
  );
}