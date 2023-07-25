// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:better_player/better_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HowToUse extends StatelessWidget {
  
  videoView(data) {
    return AspectRatio(
      aspectRatio: 1,
      child: BetterPlayer.network(
        data['url'],
        betterPlayerConfiguration: BetterPlayerConfiguration(
          aspectRatio: 1,
          autoPlay: false,
          placeholderOnTop: true,
          showPlaceholderUntilPlay: false,
          fit: BoxFit.contain,
          controlsConfiguration: const BetterPlayerControlsConfiguration(
            showControls: true,
            showControlsOnInitialize: false,
            enableSkips: false,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("How to use"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("how-to-use")
            .doc("00001111")
            .snapshots(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return videoView(data);
          }
        },
      ),
    );
  }
}