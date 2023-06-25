// // ignore_for_file: prefer_const_constructors, prefer_is_empty, prefer_final_fields, unused_field, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_print

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:tour_application/widgets/sea_widget.dart';

// import '../route/route.dart'rt';
// impo'../widgets/hill_widget.dart'.dart';
// i'../widgets/nav_home_categories.dart'ies.dart';'../widgets/park_widget.dart'widget.dart';
// import 'selectlist_screen.dar'../widgets/top-widget.dart'op-widget.dart';

// class AdminHome extends StatefulWidget {
//   @override
//   State<AdminHome> createState() => _AdminHomeState();
// }

// class _AdminHomeState extends State<AdminHome> {
//   final RxInt _currentIndex = 0.obs;

//   final List _carouselImages = [
//     'assets/carouseimage/cover-one.jpg',
//     'assets/carouseimage/cover-two.jpg',
//     'assets/carouseimage/cover-three.jpg',
//     'assets/carouseimage/cover-four.jpg',
//     'assets/carouseimage/cover-five.jpg',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ListView(
//         children: [
//           SizedBox(height: 5.h),

//           // !-----------------CarouselSlider---------------------
//           StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//               return CarouselSlider(
//                 options: CarouselOptions(
//                   height: 200.h,
//                   enlargeCenterPage: true,
//                   autoPlay: true,
//                   aspectRatio: 16 / 9,
//                   autoPlayCurve: Curves.fastOutSlowIn,
//                   enableInfiniteScroll: true,
//                   autoPlayAnimationDuration: Duration(milliseconds: 800),
//                   viewportFraction: 1,
//                   onPageChanged: (val, carouselPageChangedReason) {
//                     setState(() {
//                       _currentIndex.value = val;
//                     });
//                   },
//                 ),
//                 items: _carouselImages.map((image) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(
//                           image: AssetImage(image),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               );
//             },
//           ),

//           SizedBox(
//             height: 5.h,
//           ),
//           Obx(
//             () => DotsIndicator(
//               dotsCount:
//                   _carouselImages.length == 0 ? 1 : _carouselImages.length,
//               position: _currentIndex.value.toDouble(),
//             ),
//           ),

//           // !---------------------Top Place--------------

//           SizedBox(
//             height: 5.h,
//           ),
//           TopPlaces(),
//           SizedBox(
//             height: 5.h,
//           ),

//           //! ---------------------Hill Tours--------------
 
//           SizedBox(
//             height: 5.h,
//           ),
//           AllHillWidget(),
//           SizedBox(
//             height: 5.h,
//           ),
//           //! ---------------------Sea Places--------------

//           SizedBox(
//             height: 5.h,
//           ),
//           SeaTours(),
//           SizedBox(
//             height: 5.h,
//           ),


//           ParkTour(),

//           SizedBox(
//             height: 10.h,
//           ),
//           SelectList(),
//         ],
//       ),
//     );
//   }
// }

//           // AdminHomeCategories(
//           //   "Top Places",
//           //   () => Get.toNamed(seeAllScreen, arguments: SeeAll('top_places')),
//           // ),