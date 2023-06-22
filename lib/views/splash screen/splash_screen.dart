// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, avoid_print
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bhromon_application/constant/app_string.dart';
import 'package:bhromon_application/route/route.dart';
import 'package:bhromon_application/styles/style.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ! user find
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();

    if (user != null) {
      Timer(const Duration(seconds: 5), () => Get.toNamed(home_screen));
    } else {
      Timer(const Duration(seconds: 5), () => Get.toNamed(onboarding));
      // Timer(const Duration(seconds: 1), () => Get.toNamed(adminHome));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo/logo.png",
              height: 300.h,
            ),
            // SizedBox(
            //   height: 10.h,
            // ),
            const CircularProgressIndicator(),
            SizedBox(
              height: 10.h,
            ),
            Text(
              AppString.AppName,
              style: AppStyle().myTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}