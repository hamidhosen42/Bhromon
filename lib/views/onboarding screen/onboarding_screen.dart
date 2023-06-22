// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';
import 'package:bhromon_application/constant/app_string.dart';
import '../auth screen/login_screen.dart';

class OnboardingScreen extends StatelessWidget {

  //! ---------------Onboarding screen---------------
  final List<OnbordingData> list = [

    //! ---------------Onboarding screen1 ---------------

    OnbordingData(
      imageHeight: 300.h,
      imageWidth: 250.w,
      image: AssetImage("assets/onboarding/img1.png"),
      titleText: Text(
        AppString.onboarding_screen1_title,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
      ),
      descText: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(AppString.onboarding_screen1_subtitle,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 18.sp)),
      ),
    ),

    //! ---------------Onboarding screen2---------------
    OnbordingData(
      imageHeight: 300.h,
      imageWidth: 250.w,
      image: AssetImage("assets/onboarding/img2.png"),
      titleText: Text(AppString.onboarding_screen2_title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp)),
      descText: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(AppString.onboarding_screen2_subtitle,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 18.sp)),
      ),
    ),

    //! ---------------Onboarding screen3---------------
    OnbordingData(
      imageHeight: 300.h,
      imageWidth: 250.w,
      image: AssetImage("assets/onboarding/img3.png"),
      titleText: Text(AppString.onboarding_screen3_title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp)),
      descText: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(AppString.onboarding_screen3_subtitle,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 18.sp)),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: IntroScreen(
          onbordingDataList: list,
          colors: [
            // List of colors for each page
            Colors.white,
            Colors.black,
          ],
          pageRoute: MaterialPageRoute(
            builder: (context) =>SignInSix(),
          ),
          nextButton: Text(
            "NEXT",
            style: TextStyle(color: Colors.black, fontSize: 20.sp),
          ),
          lastButton: Text(
            "GOT IT",
            style: TextStyle(color: Colors.black, fontSize: 20.sp),
          ),
          skipButton: Text(
            "SKIP",
            style: TextStyle(color: Colors.black, fontSize: 20.sp),
          ),
          selectedDotColor: Colors.black,
          unSelectdDotColor: Colors.grey,
        ),
      ),
    );
  }
}