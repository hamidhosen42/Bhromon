// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Details_Screen/detail_screen.dart';

class ParkPlaces extends StatefulWidget {
  const ParkPlaces({super.key});

  @override
  State<ParkPlaces> createState() => _ParkPlacesState();
}

class _ParkPlacesState extends State<ParkPlaces> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('all-park').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: List.generate(snapshot.data!.docs.length, (index) {
                DocumentSnapshot document = snapshot.data!.docs[index];
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                var name = data['name'];
                 var description = data['description'];
                 var location=data['location'];
                 var duration=data['duration'];
                var rating = data['rating'];
                                var imageList = data['image_list'] as List<dynamic>;
                var eat_hotal=data['eat_hotal'];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>

                                 DetailScreen(location:location,duration:duration,description:description,name:name, imageList: imageList,eat_hotal:eat_hotal)));
                    },
                    child: Container(
                      width: 120.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.all(
                          Radius.circular(7.r),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Text(
                              data['name'].length > 12
                                  ? data['name'].substring(0, 12) +
                                      '...' // Add ellipsis if the string is longer than 10 characters
                                  : data['name'],
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          RatingBar.builder(
                            itemSize: 15.w,
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
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}