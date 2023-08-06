

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminAllTour extends StatefulWidget {
  const AdminAllTour({super.key});

  @override
  State<AdminAllTour> createState() => _AdminAllTourState();
}

class _AdminAllTourState extends State<AdminAllTour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: (){

                
              },
              
              child: Container(height: 100.h,color: Colors.red,)),
            SizedBox(height: 20.h,),
            Container(height: 100.h,color: Colors.green,),
            SizedBox(height: 20.h,),
            Container(height: 100.h,color: Colors.yellow,),
          ],
        ),
      ),
    );
  }
}