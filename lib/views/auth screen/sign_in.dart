// // ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_final_fields, prefer_const_constructors

// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:bhromon_application/route/route.dart';

// import '../../back_end/auth.dart';
// import '../../constant/app_colors.dart';
// import '../../styles/style.dart';
// import '../../widgets/violetButton.dart';
// import '../../controllers/text_field_controller.dart';

// class SignInScreen extends StatefulWidget {
//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   final authController = Get.put(AuthController());
//   final _controller = Get.put(TextFieldController());

//   late StreamSubscription subscription;
//   bool isDeviceConnected = false;
//   bool isAlertSet = false;

//   @override
//   void initState() {
//     getConnectivity();
//     super.initState();
//   }

//   getConnectivity() =>
//       subscription = Connectivity().onConnectivityChanged.listen(
//         (ConnectivityResult result) async {
//           isDeviceConnected = await InternetConnectionChecker().hasConnection;
//           if (!isDeviceConnected && isAlertSet == false) {
//             showDialogBox("", "");
//             setState(() => isAlertSet = true);
//           }
//         },
//       );

//   @override
//   void dispose() {
//     subscription.cancel();
//     super.dispose();
//   }

//   bool validateEmail(String email) {
//     return email.isNotEmpty && email.contains('@');
//   }

//   bool validatePassword(String password) {
//     return password.isNotEmpty && password.length >= 6;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: size.height * 0.18,
//               ),
//               ShaderMask(
//                 blendMode: BlendMode.srcIn,
//                 shaderCallback: (bounds) => const LinearGradient(
//                   colors: [Colors.blue, Colors.purple],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ).createShader(bounds),
//                 child: Padding(
//                   padding: const EdgeInsets.all(0.0),
//                   child: Center(
//                     child: Text(
//                       'Welcome Back!',
//                       style: GoogleFonts.courgette(
//                           color: Colors.white,
//                           fontSize: 40,
//                           fontStyle: FontStyle.normal),
//                     ),
//                   ),
//                 ),
//               ),
//               ShaderMask(
//                 blendMode: BlendMode.srcIn,
//                 shaderCallback: (bounds) => const LinearGradient(
//                   colors: [Colors.blue, Colors.purple],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ).createShader(bounds),
//                 child: Padding(
//                   padding: const EdgeInsets.all(0.0),
//                   child: Center(
//                     child: Text(
//                       'Login to continue',
//                       style: GoogleFonts.courgette(
//                         color: Colors.white,
//                         fontSize: 25,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 70.h,
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration:
//                     AppStyle().textFieldDecoration("E-mail", Icons.mail),
//               ),
//               SizedBox(
//                 height: 30.h,
//               ),
//               Obx(() {
//                 return TextFormField(
//                   controller: _passwordController,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black, width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black, width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                     prefixIcon: const Icon(
//                       Icons.lock_open,
//                       color: Colors.black45,
//                     ),
//                     hintText: "Password",
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _controller.isPasswordHiden.value
//                             ? Icons.visibility_off
//                             : Icons.visibility,
//                         color: Colors.black45,
//                       ),
//                       onPressed: () {
//                         _controller.isPasswordHiden.value =
//                             !_controller.isPasswordHiden.value;
//                       },
//                     ),
//                   ),
//                   obscureText: _controller.isPasswordHiden.value,
//                 );
//               }),
//               Row(
//                 children: [
//                   const Spacer(),
//                   TextButton(
//                       onPressed: () {
//                         Get.toNamed(resetPassword);
//                       },
//                       child: Text("Forget Password?",
//                           style: TextStyle(
//                               color: Colors.deepPurpleAccent,
//                               fontSize: 16.sp))),
//                 ],
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Obx(() {
//                 return VioletButton(
//                   isLoading: authController.isLoading.value,
//                   title: "Login",
//                   onAction: () async {
//                     String email = _emailController.text;
//                     String password = _passwordController.text;

//                     if (!validateEmail(email)) {
//                       // Show an error message for invalid email
//                       showDialogBox(
//                           "Invalid Email", "Please enter a valid email.");
//                       return;
//                     }

//                     if (!validatePassword(password)) {
//                       // Show an error message for invalid password
//                       showDialogBox("Invalid Password",
//                           "Password should be at least 6 characters long.");
//                       return;
//                     }

//                     authController.isLoading(true);
//                     await authController.userLogin(
//                       context: context,
//                       email: email,
//                       password: password,
//                     );
//                     authController.isLoading(false);
//                   },
//                 );
//               }),
//               SizedBox(height: 10.h),
//               Center(
//                 child: Text(
//                   "--OR--",
//                   style: TextStyle(
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               Center(
//                 child: IconButton(
//                     onPressed: () {
//                       var obj = AuthController();
//                       obj.signInWithGoogle(context);
//                     },
//                     icon: Icon(
//                       FontAwesomeIcons.google,
//                       color: Colors.blueAccent,
//                       size: 40.sp,
//                     )),
//               ),
//               SizedBox(height: 10.h),
//               Center(
//                 child: RichText(
//                   text: TextSpan(
//                     text: "Don’t have registered yet?  ",
//                     style: TextStyle(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w300,
//                       color: Colors.black,
//                     ),
//                     children: [
//                       TextSpan(
//                           text: "Sign Up",
//                           style: TextStyle(
//                             fontSize: 18.sp,
//                             fontWeight: FontWeight.w600,
//                             color: AppColors.violetColor,
//                           ),
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () => Get.toNamed(signUp)),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   showDialogBox(String title, String message) => showCupertinoDialog<String>(
//         context: context,
//         builder: (BuildContext context) => CupertinoAlertDialog(
//           title: Text(title),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context, 'Cancel');
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       );
// }
