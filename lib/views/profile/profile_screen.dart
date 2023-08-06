// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unused_local_variable, unused_import, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_application/route/route.dart';
import 'package:tour_application/views/auth%20screen/sign_in.dart';
import 'package:tour_application/views/profile/profile_edit_screen.dart';

import '../../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    // final name = user?.displayName ?? 'No display available';
    // final email = user?.email ?? 'No email available';
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      var data = snapshot.data;
                      return Card(
                        elevation: 3,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      ClipOval(
                                        clipBehavior: Clip.hardEdge,
                                        child: GestureDetector(
                                          onTap: () async {
                                            // Use Navigator to show a full-screen image page
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Scaffold(
                                                  backgroundColor: Colors.grey,
                                                  body: Center(
                                                    child: Hero(
                                                        tag: 'user-avatar',
                                                        child:
                                                            data['image_url'] !=
                                                                    ""
                                                                ? Image.network(
                                                                    data[
                                                                        'image_url'],
                                                                    // width: 100,
                                                                    // height: 100,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : Image.asset(
                                                                    "assets/avatar.png",
                                                                    height: 100,
                                                                    width: 100,
                                                                  )),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                              tag: 'user-avatar',
                                              child: data!['image_url'] != ""
                                                  ? Image.network(
                                                      data['image_url'],
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.asset(
                                                      "assets/avatar.png",
                                                      height: 100,
                                                      width: 100,
                                                    )),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -12,
                                        right: -15,
                                        child: IconButton(
                                          onPressed: () async {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        ProfileEditScreen()));
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                            size: 30.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          data['name'],
                                          style: GoogleFonts.lato(fontSize: 25),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 2, bottom: 5),
                                        child: Text(data['email']),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 2, bottom: 5),
                                        child: Text(data['phone_number']),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 2, bottom: 5),
                                        child: Text(data['address']),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                Card(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 10,
                      bottom: 5,
                      top: 6,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.support),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              'Support',
                              style: GoogleFonts.lato(fontSize: 20.sp),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () async {
                              await Get.toNamed(supportScreen);
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Card(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 10,
                      bottom: 5,
                      top: 6,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.privacy_tip),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              'Privacy',
                              style: GoogleFonts.lato(fontSize: 20.sp),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () async {
                              await Get.toNamed(privacyPolicy);
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Card(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 10,
                      bottom: 5,
                      top: 6,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.question_answer),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              'FAQ',
                              style: GoogleFonts.lato(fontSize: 20.sp),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () async {
                              await Get.toNamed(faqScreen);
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Card(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 10,
                      bottom: 5,
                      top: 6,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.language),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              'Language',
                              style: GoogleFonts.lato(fontSize: 20.sp),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () async {
                              // await Get.toNamed(faqScreen);
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Card(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 10,
                      bottom: 5,
                      top: 6,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.color_lens),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              'Theme',
                              style: GoogleFonts.lato(fontSize: 20.sp),
                            ),
                          ],
                        ),
                        Switch(
                            value: themeManager.themeMode == ThemeMode.dark,
                            onChanged: (value) async {
                              setState(() {
                                themeManager.toggleTheme(value);
                              });
                            })
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SignInScreen()));
                  },
                  child: Card(
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 10,
                        bottom: 5,
                        top: 6,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.logout),
                                SizedBox(
                                  width: 10.h,
                                ),
                                Text(
                                  'LogOut',
                                  style: GoogleFonts.lato(fontSize: 23.sp),
                                ),
                              ],
                            ),
                            // IconButton(
                            //     onPressed: () async {
                            //       // await Get.toNamed(faqScreen);
                            //     },
                            //     icon: const Icon(Icons.arrow_forward_ios_rounded))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}