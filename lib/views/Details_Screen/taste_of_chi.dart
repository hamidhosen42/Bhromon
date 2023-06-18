
// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_element, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestEatTourScreen extends StatefulWidget {
    final String eat_hotal;

    
  TestEatTourScreen({
    required this.eat_hotal
  });

  @override
  State<TestEatTourScreen> createState() => _TestEatTourScreenState();
}

class _TestEatTourScreenState extends State<TestEatTourScreen> {


  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                widget.eat_hotal.replaceAll('@@', '\n\n'),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}