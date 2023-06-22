// // ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, avoid_print

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:bhromon_application/const/app_colors.dart';
// import 'package:bhromon_application/screen/main_home_screen.dart';

// import '../styles/style.dart';

// class AuthHelper {
//   final box = GetStorage();
//   Future phoneAuth(number, context) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     TextEditingController _controler = TextEditingController();

//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: number,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         UserCredential _userCredential =
//             await auth.signInWithCredential(credential);
//         User? _user = _userCredential.user;

//         if (_user!.uid.isNotEmpty) {
//           box.write('uid', _user.uid);
//           Navigator.push(
//               context, MaterialPageRoute(builder: (_) => MainHomeScreen()));
//         } else {
//           SnackBar(
//             content: (Text("Phone Auth Field")),
//           );
//         }
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         if (e.code == 'invalid-phone-number') {
//           print('The provided phone number is not valid.');
//         }
//       },
//       codeSent: (String verificationId, int? resendToken) async {
//         showDialog(
//             context: context,
//             builder: (_) {
//               return AlertDialog(
//                 title: Center(child: Text("Enter your OTP")),
//                 content: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     TextFormField(
//                         controller: _controler,
//                         keyboardType: TextInputType.number,
//                         decoration:
//                             AppStyle().textFieldDecoration("Phone Number")),
//                     ElevatedButton(
//                         onPressed: () async {
//                           PhoneAuthCredential _credential =
//                               PhoneAuthProvider.credential(
//                                   verificationId: verificationId,
//                                   smsCode: _controler.text);

//                           UserCredential _userCredential =
//                               await auth.signInWithCredential(_credential);
//                           User? _user = _userCredential.user;

//                           if (_user!.uid.isNotEmpty) {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (_) => MainHomeScreen()));
//                           } else {
//                             SnackBar(
//                               content: (Text("Phone Auth Field")),
//                             );
//                           }
//                         },
//                         style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all(AppColors.violetColor),
//                         ),
//                         child: Text(
//                           "Continue",
//                           style: TextStyle(color: Colors.white),
//                         ))
//                   ],
//                 ),
//               );
//             });
//       },
//       timeout: const Duration(seconds: 60),
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }
// }