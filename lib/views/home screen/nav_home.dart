// ignore_for_file: prefer_const_constructors, prefer_is_empty, prefer_final_fields, unused_field, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_application/widgets/sea_widget.dart';

import '../../route/route.dart';
import '../../widgets/hill_widget.dart';
import '../../widgets/nav_home_categories.dart';
import '../../widgets/park_widget.dart';
import 'selectlist_screen.dart';
import '../../widgets/top-widget.dart';

class NavHome extends StatefulWidget {
  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  final RxInt _currentIndex = 0.obs;

  final List _carouselImages = [
    'assets/carouseimage/cover-one.jpg',
    'assets/carouseimage/cover-two.jpg',
    'assets/carouseimage/cover-three.jpg',
    'assets/carouseimage/cover-four.jpg',
    'assets/carouseimage/cover-five.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 5.h),

          // !-----------------CarouselSlider---------------------
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return CarouselSlider(
                options: CarouselOptions(
                  height: 200.h,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1,
                  onPageChanged: (val, carouselPageChangedReason) {
                    setState(() {
                      _currentIndex.value = val;
                    });
                  },
                ),
                items: _carouselImages.map((image) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),

          SizedBox(
            height: 5.h,
          ),
          Obx(
            () => DotsIndicator(
              dotsCount:
                  _carouselImages.length == 0 ? 1 : _carouselImages.length,
              position: _currentIndex.value.toDouble(),
            ),
          ),

          // !---------------------Top Place--------------
          navHomeCategories(
            "Top Tours",
            () => Get.toNamed(see_all_topplace),
          ),
          SizedBox(
            height: 5.h,
          ),
          TopPlaces(),
          SizedBox(
            height: 5.h,
          ),

          //! ---------------------Hill Tours--------------
          navHomeCategories(
            "Hill Tours",
            () => Get.toNamed(see_all_hill),
          ),
          SizedBox(
            height: 5.h,
          ),
          AllHillWidget(),
          SizedBox(
            height: 5.h,
          ),
          //! ---------------------Sea Places--------------
          navHomeCategories(
            "Sea Tours",
            () => Get.toNamed(see_all_sea),
          ),
          SizedBox(
            height: 5.h,
          ),
          SeaTours(),
          SizedBox(
            height: 5.h,
          ),

          // !----------------Park Places------------------
          navHomeCategories("Park Tours", ()=>Get.toNamed(see_all_park)),
          ParkTour(),

          SizedBox(
            height: 10.h,
          ),
          SelectList(),
        ],
      ),
    );
  }
}

          // navHomeCategories(
          //   "Top Places",
          //   () => Get.toNamed(seeAllScreen, arguments: SeeAll('top_places')),
          // ),