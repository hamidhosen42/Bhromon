// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';
import 'package:tour_application/constant/app_string.dart';
import '../auth screen/sign_in.dart';

class OnboardingScreen extends StatelessWidget {
  final List<OnbordingData> list = [
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
        decoration: BoxDecoration(
          color: Colors.black, // Set the background color here
        ),
        child: IntroScreen(
          onbordingDataList: list,
          colors: [
            // List of colors for each page
            Colors.white,
            Colors.black,
          ],
          pageRoute: MaterialPageRoute(
            builder: (context) => SignInScreen(),
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