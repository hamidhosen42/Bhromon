// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, prefer_final_fields, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:tour_application/admin/admin_all_user.dart';

import 'admin_nav_home.dart';

class AdminNavController extends StatefulWidget {
  @override
  State<AdminNavController> createState() => _AdminNavControllerState();
}

class _AdminNavControllerState extends State<AdminNavController> {
  RxInt _currentIndex = 0.obs;

  final _pages = [AdminAllUser(), AdminNavHome(), AdminNavHome()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(),
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 5.0,
            clipBehavior: Clip.antiAlias,
            child: Container(
              height: 90.h,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                ),
                child: BottomNavigationBar(
                    currentIndex: _currentIndex.value,
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.black,
                    onTap: (value) => _currentIndex.value = value,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), label: "User"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined), label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), label: "Profile"),
                    ]),
              ),
            ),
          ),
          body: _pages[_currentIndex.value],
        ),
      ),
    );
  }
}
