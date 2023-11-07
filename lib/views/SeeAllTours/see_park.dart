// ignore_for_file: avoid_print, prefer_const_constructors, non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Details_Screen/detail_screen.dart';

class SeeAllPark extends StatefulWidget {
  const SeeAllPark({super.key});

  @override
  State<SeeAllPark> createState() => _SeeAllParkState();
}

class _SeeAllParkState extends State<SeeAllPark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "See All Park Tours",
          style: TextStyle(fontSize: 25.sp),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('all-park').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              // scrollDirection: Axis.horizonta,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 10.0, // Spacing between columns
                mainAxisSpacing: 10.0, // Spacing between rows
              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot document = snapshot.data!.docs[index];
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                var name = data['name'];
                var description = data['description'];
                var location = data['location'];
                var duration = data['duration'];
                var rating = data['rating'];
                var imageList = data['image_list'] as List<dynamic>;
                var eat_hotal = data['eat_hotal'];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailScreen(
                                location: location,
                                duration: duration,
                                description: description,
                                name: name,
                                imageList: imageList,
                                eat_hotal: eat_hotal)));
                  },
                  child: Container(
                    width: 120.w,
                    height: 220.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.r),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7.r),
                            topRight: Radius.circular(7.r),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: data['image'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 130.h,
                            filterQuality: FilterQuality.high,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Text(
                          data['name'].length > 17
                              ? data['name'].substring(0, 17) +
                                  '...' // Add ellipsis if the string is longer than 10 characters
                              : data['name'],
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              data['duration'].toString(), // Price value
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        RatingBar.builder(
                          itemSize: 16.w,
                          initialRating: rating.toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.red,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          height: 5.sp,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
