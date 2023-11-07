// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constant/app_string.dart';
import '../BottomBavBarView/bottom_view.dart';

class HomeAppScreen extends StatefulWidget {
  @override
  State<HomeAppScreen> createState() => _HomeAppScreenState();
}

class _HomeAppScreenState extends State<HomeAppScreen> {
  Future _exitDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are you sure to close this app?"),
            content: Row(
              children: [
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: Text("No"),
                ),
                SizedBox(
                  width: 20.w,
                ),
                ElevatedButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: Text("Yes"),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _exitDialog(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            title: Row(
              children: [
                SizedBox(
                  height: 60.h,
                  width: 70.w,
                  child: Image.asset(
                    'assets/logo/logo.png',
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  AppString.AppName.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                  ),
                ),
              ],
            ),
            elevation: 0,
            backgroundColor: Colors.white),
        body: Stack(
          children: [
            BottomNavController(),
          ],
        ),
      ),
    );
  }
}
