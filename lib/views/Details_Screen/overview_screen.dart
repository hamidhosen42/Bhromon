// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, prefer_interpolation_to_compose_strings, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bhromon_application/views/Details_Screen/price_duration_tile.dart';

import '../Googele Map/place_location.dart';
import 'services_tile.dart';

class OverviewScreen extends StatefulWidget {
  final String place;
  final String location;
  final String duration;
  OverviewScreen(
      {required this.location, required this.duration, required this.place});

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
                IconButton(
                  onPressed: () async {
                    var address = widget.place + " " + widget.location;

                    String latitude_longitude_addres = "";
                    String query_address = "";

                    List<Location> locations =
                        await locationFromAddress(address);

                    List<Placemark> placemarks = await placemarkFromCoordinates(
                        locations.last.latitude, locations.last.longitude);

                    setState(() {
                      // latitude_longitude_addres =
                      //     locations.last.latitude.toString() +
                      //         "   " +
                      //         locations.last.longitude.toString();
                      // query_address =
                      //     placemarks.reversed.last.country.toString();

                      var latitude_address =
                          double.parse(locations.last.latitude.toString());

                      var longitude_address =
                          double.parse(locations.last.longitude.toString());

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PlaceLocation(
                                    latitude_address: latitude_address,
                                    longitude_address: longitude_address,
                                    location:widget.location
                                  )));
                    });
                  },
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.blue,
                  ),
                ),
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
                    servicesTile(Icons.pool, 'Swimming pool', context, () {}),
                    servicesTile(Icons.fitness_center, 'Gym', context, () {}),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    servicesTile(
                        Icons.food_bank_outlined, 'Food', context, () {}),
                    servicesTile(Icons.fitness_center, 'Food', context, () {}),
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
