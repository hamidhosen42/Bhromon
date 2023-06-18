// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unused_field, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_application/constant/app_string.dart';
import 'package:velocity_x/velocity_x.dart';

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("privacyPolicy".tr)),
      body: Padding(
        padding: EdgeInsets.all(18.h),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                introEng,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              10.h.heightBox,
              Text(
                headingEng,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                ),
              ),
              15.h.heightBox,
              customDescriptionText(title: title1Eng, desc: desc1Eng),
              10.h.heightBox,
              customDescriptionText(title: title2Eng, desc: desc2Eng),
              10.h.heightBox,
              customDescriptionText(title: title3Eng, desc: desc3Eng),
              10.h.heightBox,
              customDescriptionText(title: title4Eng, desc: desc4Eng),
              10.h.heightBox,
              customDescriptionText(title: title5Eng, desc: desc5Eng),
              10.h.heightBox,
              customDescriptionText(title: title6Eng, desc: desc6Eng),
              10.h.heightBox,
              customDescriptionText(title: title7Eng, desc: desc7Eng),
              10.h.heightBox,
              customDescriptionText(title: title8Eng, desc: desc8Eng),
              10.h.heightBox,
              Text(
                conclusionEng,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customDescriptionText({required String title, required String desc}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        5.h.heightBox,
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            desc.tr,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 16.sp,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}