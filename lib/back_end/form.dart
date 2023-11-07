// // ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

// import '../route/route.dart';

// class UsersInfo{
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   sendFormDataToDB(
//       String name, int phone, String address, String dob, String gender) async {
//     try {
//       CollectionReference _course =
//           FirebaseFirestore.instance.collection("users-form-data");
//       _course.doc(_auth.currentUser!.email).set({
//         'name': name,
//         'phone': phone,
//         'address': address,
//         'dob': dob,
//         'gender': gender,
//       }).whenComplete(
//         () {
//            showTopSnackBar(
//               Overlay.of(context),
//               CustomSnackBar.success(
//                 message:
//                    "Added Successfully",
//               ),
//             );
//           Get.toNamed(privacyPolicy);
//         },
//       );
//     } catch (e) {
//        showTopSnackBar(
//               Overlay.of(context),
//               CustomSnackBar.error(
//                 message:
//                     "error: $e",
//               ),
//             );
//     }
//   }
// }
