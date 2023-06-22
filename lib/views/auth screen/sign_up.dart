// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_element

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bhromon_application/views/auth%20screen/sign_in.dart';

import '../../../controllers/text_field_controller.dart';
import '../../back_end/auth.dart';
import '../../constant/app_colors.dart';
import '../../styles/style.dart';
import '../../widgets/violetButton.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final authController = Get.put(AuthController());
  final _controller = Get.put(TextFieldController());

  bool _validateEmail(String email) {
    // Simple email validation, you can replace it with your own validation logic
    return email.contains('@');
  }

  bool _validatePassword(String password) {
    // Simple password validation, you can replace it with your own validation logic
    return password.length >= 6;
  }

  bool _validatePhoneNumber(String phoneNumber) {
    // Simple phone number validation, you can replace it with your own validation logic
    return phoneNumber.length >= 11;
  }

  bool _validateAddress(String address) {
    // Simple address validation, you can replace it with your own validation logic
    return address.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.courgette(
                          color: Colors.white,
                          fontSize: 40,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
              ),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(
                    child: Text(
                      'Create Account',
                      style: GoogleFonts.courgette(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    AppStyle().textFieldDecoration("Full Name", Icons.person),
              ),
              SizedBox(
                height: 12.h,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    AppStyle().textFieldDecoration("E-mail", Icons.mail),
              ),
              SizedBox(
                height: 12.h,
              ),
              Obx(() {
                return TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_open,
                      color: Colors.black45,
                    ),
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _controller.isPasswordHiden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black45,
                      ),
                      onPressed: () {
                        _controller.isPasswordHiden.value =
                            !_controller.isPasswordHiden.value;
                      },
                    ),
                  ),
                  obscureText: _controller.isPasswordHiden.value,
                  validator: (value) {
                    if (!_validatePassword(value ?? '')) {
                      return 'Invalid password';
                    }
                    return null;
                  },
                );
              }),
              SizedBox(
                height: 12.h,
              ),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration:
                    AppStyle().textFieldDecoration("Phone Number", Icons.phone),
                validator: (value) {
                  if (!_validatePhoneNumber(value ?? '')) {
                    return 'Invalid phone number';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 12.h,
              ),
              TextFormField(
                controller: _addressController,
                keyboardType: TextInputType.text,
                decoration: AppStyle().textFieldDecoration(
                    "Enter your address", Icons.location_city_rounded),
                validator: (value) {
                  if (!_validateAddress(value ?? '')) {
                    return 'Address is required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Creating an account means you\'re okay with our Terms of Services and our Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black45),
              ),
              SizedBox(
                height: 20.h,
              ),
              Obx(() {
                return VioletButton(
                  isLoading: authController.isLoading.value,
                  title: 'Create Account',
                  onAction: () async {
                    if (_nameController.text.isEmpty) {
                      Get.snackbar('Error', 'Name is required');
                      return;
                    }

                    if (_emailController.text.isEmpty) {
                      Get.snackbar('Error', 'Email is required');
                      return;
                    }

                    if (_passwordController.text.isEmpty) {
                      Get.snackbar('Error', 'Password is required');
                      return;
                    }

                    if (_phoneController.text.isEmpty) {
                      Get.snackbar('Error', 'Phone number is required');
                      return;
                    }

                    if (_addressController.text.isEmpty) {
                      Get.snackbar('Error', 'Address is required');
                      return;
                    }

                    authController.isLoading(true);

                    await authController.registration(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                      number: _phoneController.text.toString(),
                      address: _addressController.text,
                      image: "",
                    );
                    authController.isLoading(false);
                  },
                );
              }),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  "--OR--",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Center(
                child: IconButton(
                    onPressed: () {
                      var obj = AuthController();
                      obj.signInWithGoogle(context);
                    },
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: Colors.blueAccent,
                      size: 40.sp,
                    )),
              ),
              SizedBox(height: 10.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already a user?  ",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Log In",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.violetColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => SignInSix()),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}