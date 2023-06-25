// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_local_variable, prefer_is_empty

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tour_application/views/Details_Screen/scrollsheet_screen.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  final String description;
  final String location;
  final String duration;
  final String eat_hotal;
  final List imageList;

  DetailScreen(
      {required this.location,
      required this.duration,
      required this.description,
      required this.name,
      required this.imageList,
      required this.eat_hotal});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  Future addToFavourite() async {
    var ref = FirebaseFirestore.instance
        .collection("users-favourite-items")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("place")
        .doc();

        String id = DateTime.now().microsecondsSinceEpoch.toString();

    ref.set({
      'location': widget.location,
      'duration': widget.duration,
      'description': widget.description,
      'name': widget.name,
      'image': widget.imageList,
      'eat_hotal': widget.eat_hotal,
    }).then(
      (value) => Fluttertoast.showToast(
        msg: "Added to favourite place",
        backgroundColor: Colors.black87,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.imageList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          backgroundColor: Colors.black,
                          body: Center(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              width: double.infinity,
                              child: Hero(
                                tag: 'tour-image',
                                child: CachedNetworkImage(
                                  imageUrl: widget.imageList[index],
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: CachedNetworkImage(
                    imageUrl: widget.imageList[index],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: 70.h, right: 10, bottom: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.black26),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Colors.black26,
                  ),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users-favourite-items')
                          .doc(FirebaseAuth.instance.currentUser!.email)
                          .collection("place")
                          .where("name", isEqualTo: widget.name)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.data == null) {
                          return Center(child: Text('Place is Empty'));
                        }
                        if (snapshot.hasError) {
                          return Center(child: Text('Something went wrong'));
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return IconButton(
                          icon: snapshot.data!.docs.length == 0
                              ? Icon(
                                  Icons.favorite_border,
                                  size: 30,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  size: 30,
                                  color: Colors.red,
                                ),
                          onPressed: () => snapshot.data!.docs.length == 0
                              ? addToFavourite()
                              : Fluttertoast.showToast(
                                  msg: "Already Added",
                                  backgroundColor: Colors.black87,
                                ),
                        );
                      }),
                ),
              ],
            ),
          ),
          ScrollSheet(
              tabController: tabController!,
              location: widget.location,
              duration: widget.duration,
              place: widget.name,
              description: widget.description,
              eat_hotal: widget.eat_hotal),
        ],
      ),
    );
  }
}