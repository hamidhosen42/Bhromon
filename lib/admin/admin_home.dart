// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/app_string.dart';
import 'admin_nav_controller.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(onPressed: (){}, icon: Icon(Icons.add)),
            )
          ],
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
        body:Stack(
          children: [
           AdminNavController()
          ],
      ),
      )
    );
  }
}
