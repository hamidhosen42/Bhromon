// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bhromon_application/views/Details_Screen/description.dart';
import 'package:bhromon_application/views/Details_Screen/overview_screen.dart';

import 'taste_of_chi.dart';

class ScrollSheet extends StatelessWidget {
  final TabController tabController;
  final String description;
  final String place;
  final String location;
  final String duration;
  final String eat_hotal;
  ScrollSheet(
      {
      required this.location,
      required this.duration,
      required this.place,
      required this.description,
      required this.eat_hotal, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      maxChildSize: 1.0,
      minChildSize: 0.55,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 5,
                    width: 44,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                TabBar(
                  indicatorColor: Colors.black,
                  labelStyle: GoogleFonts.lato(fontSize: 18),
                  controller: tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: 'Overview'),
                    Tab(text: 'Description'),
                    Tab(text: 'Delish'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: TabBarView(controller: tabController, children: [
                    OverviewScreen(
                        location: location, duration: duration, place: place),
                    Description(description: description),
                    TestEatTourScreen(eat_hotal: eat_hotal),
                  ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}