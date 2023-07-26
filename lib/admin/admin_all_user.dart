// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable, use_build_context_synchronously, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../views/Details_Screen/detail_screen.dart';

class AdminAllUser extends StatefulWidget {
  const AdminAllUser({Key? key}) : super(key: key);

  @override
  State<AdminAllUser> createState() => _AdminAllUserState();
}

class _AdminAllUserState extends State<AdminAllUser> {
  // Method to delete a user from Firebase Authentication
  Future<void> deleteFirebaseUser(String email) async {
  try {
    // Find the user with the provided email
    User? userToDelete = (await FirebaseAuth.instance.fetchSignInMethodsForEmail(email)).isEmpty
        ? null
        : (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: "randompassword")).user;

    if (userToDelete == null) {
      throw Exception("User with email $email not found.");
    }

    // Check if the user to delete is the currently logged-in admin user. If yes, don't allow the deletion.
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.uid == userToDelete.uid) {
      throw Exception("Cannot delete the currently logged-in admin user.");
    }

    // Delete the user from Firebase Authentication
    await userToDelete.delete();
  } catch (e) {
    throw Exception("Failed to delete user: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All USER",
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Card(
                    elevation: 4, // Sets the shadow depth of the card
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Sets the border radius of the card
                    ),
                    child: ListTile(
                      trailing: InkWell(
                          onTap: () async {
                            // Get the user ID you want to delete
                            String userIdToDelete = document.id;

                            try {
                              // Step 1: Delete user from Firebase Authentication
                              await deleteFirebaseUser(data['email']);

                              // // Step 2: Delete user data from Firestore collection
                              // await FirebaseFirestore.instance
                              //     .collection('users')
                              //     .doc(userIdToDelete)
                              //     .delete();

                              // Step 3: Show a success message or perform any additional actions
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('User deleted successfully')),
                              );
                            } catch (e) {
                              // Show an error message if the user deletion fails
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Failed to delete user')),
                              );
                            }
                          },
                          child: Icon(Icons.delete_sharp)),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          data['image_url'],
                        ),
                        radius: 30.r,
                      ),
                      title: Text(data['name']),
                      subtitle: Text(data['email']),
                    ),
                  ));
            },
          );
        },
      ),
    );
  }
}