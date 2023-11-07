// ignore_for_file: prefer_const_constructors, prefer_is_empty, prefer_final_fields, unused_field, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_application/views/SelectTourPlaces/select_tour_places.dart';
import 'package:tour_application/views/TourCategories/tour_categories.dart';

import '../../route/route.dart';
import '../HillTours/hill_tours.dart';
import '../PartTours/park_tours.dart';
import '../SeaTours/sea_tours.dart';
import '../TopTours/top-tours.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        // physics: ClampingScrollPhysics(),
        child: Column(
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
            TourCategories(
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
            TourCategories(
              "Hill Tours",
              () => Get.toNamed(see_all_hill),
            ),
            SizedBox(
              height: 5.h,
            ),
            HillPlaces(),
            SizedBox(
              height: 5.h,
            ),
            //! ---------------------Sea Places--------------
            TourCategories(
              "Sea Tours",
              () => Get.toNamed(see_all_sea),
            ),
            SizedBox(
              height: 5.h,
            ),
            SeaPlaces(),
            SizedBox(
              height: 5.h,
            ),

            // !----------------Park Places------------------
            TourCategories("Park Tours", () => Get.toNamed(see_all_park)),
            ParkPlaces(),

            SizedBox(
              height: 10.h,
            ),
            SelectTourPlaces(),
          ],
        ),
      ),
    );
  }
}

          // HomeScreenCategories(
          //   "Top Places",
          //   () => Get.toNamed(seeAllScreen, arguments: SeeAll('top_places')),
          // ),