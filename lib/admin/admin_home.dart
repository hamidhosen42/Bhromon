// // ignore_for_file: prefer_const_constructors

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../constant/app_string.dart';
// import 'admin_nav_controller.dart';

// class AdminHome extends StatefulWidget {
//   const AdminHome({super.key});

//   @override
//   State<AdminHome> createState() => _AdminHomeState();
// }

// class _AdminHomeState extends State<AdminHome> {
//   Future _exitDialog(context) {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Are you sure to close this app?"),
//             content: Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () => Get.back(),
//                   child: Text("No"),
//                 ),
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 ElevatedButton(
//                   onPressed: () => SystemNavigator.pop(),
//                   child: Text("Yes"),
//                 ),
//               ],
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () {
//         _exitDialog(context);
//         return Future.value(false);
//       },
//       child: Scaffold(
//         body: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection('users').snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.hasError) {
//               return Center(child: Text('Something went wrong'));
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             }

//             return ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (BuildContext context, int index) {
//                 DocumentSnapshot document = snapshot.data!.docs[index];
//                 Map<String, dynamic> data =
//                     document.data()! as Map<String, dynamic>;
//                 var name = data['name'];

//                 return ListTile(
//                   title: Text(name),
//                   // Add other widgets as needed for your list item
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
