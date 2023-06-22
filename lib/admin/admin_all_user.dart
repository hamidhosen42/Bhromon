// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminAllUser extends StatefulWidget {
  const AdminAllUser({Key? key}) : super(key: key);

  @override
  State<AdminAllUser> createState() => _AdminAllUserState();
}

class _AdminAllUserState extends State<AdminAllUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot document = snapshot.data!.docs[index];
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                var name = data['name'];
                var image = data['image_url'];
                var email = data['email'];

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: image != null
                          ? CachedNetworkImage(
                              imageUrl: image,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.person),
                            )
                          : Icon(Icons.person),
                    ),
                    title: Text(name),
                    subtitle: Text(email),
                    // Add other widgets as needed for your list item
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
