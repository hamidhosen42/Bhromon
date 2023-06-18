// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_application/views/Details_Screen/price_duration_tile.dart';

import 'services_tile.dart';

class OverviewScreen extends StatefulWidget {
  final String place;
  final String location;
  final String duration;
  OverviewScreen(
      {required this.location,
      required this.duration,
      required this.place});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.place,
                  style: GoogleFonts.lato(
                      fontSize: 21, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.location_on_outlined),
                Expanded(
                  child: Text(
                    widget.location,
                    style: GoogleFonts.lato(fontSize: 18.sp),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // priceDurationTile('Price', context,),
                priceDurationTile('Duration', context, widget.duration),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Services',
                style:
                    GoogleFonts.lato(fontSize: 19, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
                  height: 20.h,
                ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    servicesTile(Icons.follow_the_signs_sharp, 'Famous Spots',
                        context, () {}),
                    servicesTile(
                        Icons.house_outlined, 'Hotels', context, () {}),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    servicesTile(Icons.pool, 'Swimming pool',
                        context, () {}),
                    servicesTile(
                        Icons.fitness_center, 'Gym', context, () {}),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}