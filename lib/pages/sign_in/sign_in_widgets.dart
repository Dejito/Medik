import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import '../../common/widget/base_text_widget.dart';


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

// Widget reusableText(String text) {
//   return Container(
//     margin: EdgeInsets.only(bottom: 5.h, top: 14.h),
//     child: Text(
//       text,
//       style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
//     ),
//   );
// }

Widget reusableMenuText(String text,
    {Color backgroundColor = AppColors.primaryElement,
      Color textColor = AppColors.primaryElementText}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: backgroundColor)),
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
    child: reusableText(text,
        color: textColor, fontWeight: FontWeight.normal, fontSize: 11),
  );
}


Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/icons/Image(1).png")
        )
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best course for IT and Engineering",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryElementText
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          "Flutter best course",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.primaryFourElementText
          ),
        ),

      ],
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName, void Function(String value)? onTextChanged) {
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
            onChanged: (value) =>
              onTextChanged!(value),
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
    String buttonType, void Function() onTap,
    ) {
  return GestureDetector(
    onTap: onTap,
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