// // ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, must_be_immutable, unused_field, unused_local_variable
// import 'package:flutter/material.dart';

// import '../back_end/phone_auth.dart';
// import '../styles/style.dart';
// import '../widgets/violetButton.dart';

// class PhoneAuth extends StatelessWidget {
//   TextEditingController _phoneController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                   controller: _phoneController,
//                   keyboardType: TextInputType.number,
//                   decoration: AppStyle().textFieldDecoration("Phone Number")),
//               SizedBox(
//                 height: 20,
//               ),
//               VioletButton(
//                   "Submit",
//                   () =>AuthHelper().phoneAuth(_phoneController.text, context)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }