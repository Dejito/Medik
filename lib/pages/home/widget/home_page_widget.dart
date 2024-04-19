import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';
import '../../../common/widget/base_text_widget.dart';
import '../../sign_in/sign_in_widgets.dart';
import '../bloc/homepage_bloc.dart';

AppBar buildHomePageAppBar() {
  return AppBar(
    title: SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 7.w, right: 7.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 15.w,
              height: 12.h,
              child: Image.asset('assets/icons/menu.png'),
            ),
            GestureDetector(
              child: Container(
                width: 20.w,
                height: 17.5.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/person.png"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget menuView() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            reusableText("Choose your course"),
            reusableText("See all",
                fontSize: 10, color: AppColors.primaryThreeElementText),

          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
          children: [
            reusableMenuText('All', ),
            reusableMenuText('Popular', backgroundColor: Colors.transparent, textColor: AppColors.primaryThreeElementText ),
            reusableMenuText('Newest', backgroundColor: Colors.transparent, textColor: AppColors.primaryThreeElementText),
          ],
        ),
      )
    ],
  );
}


Widget searchView() {
  return Row(
    children: [
      Container(
        height: 40.h,
        width: 280.w,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.h,
              child: Image.asset('assets/icons/search.png'),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: TextField(
                // onChanged: (value) => onTextChanged!(value),
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                    hintText: "search for your course",
                    hintStyle: TextStyle(
                        fontFamily: "Avenir",
                        color: Colors.grey.withOpacity(.9),
                        fontWeight: FontWeight.normal),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none)),
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset('assets/icons/options.png'),
        ),
      )
    ],
  );
}

Widget slidersView(
    {required BuildContext context, required HomepageState state}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomepageBloc>().add(HomeDotsEvent(value));
            // print(state.index);
          },
          children: [
            sliderContainer('Art'),
            sliderContainer('Image(1)'),
            sliderContainer('Image(2)'),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 3.h),
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
              color: AppColors.primaryThreeElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17, 5),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),),),
        ),
      )
    ],
  );
}

Widget sliderContainer(String imageName) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(
        20.h,
      )),
      image: DecorationImage(
          image: AssetImage("assets/icons/$imageName.png"), fit: BoxFit.fill),
    ),
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