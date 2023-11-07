// ignore_for_file: prefer_const_constructors, unused_import, no_leading_underscores_for_local_identifiers, unused_local_variable, use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../admin/nav_home.dart';
import '../model/user_model.dart';
import '../route/route.dart';

class AuthController extends GetxController {
  //for button loading indicator
  var isLoading = false.obs;

  Future<void> registration({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String address,
    required String image,
  }) async {
    try {
      if (name.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          address.isNotEmpty) {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // Send email verification
        await userCredential.user!.sendEmailVerification();

        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.success(
            message: "Please check your email for verification.",
          ),
        );

        // No redirect to home screen yet
        // After saving user info, check email verification status
        bool isEmailVerified = userCredential.user!.emailVerified;

        UserModel userModel = UserModel(
          name: name,
          uid: userCredential.user!.uid,
          email: email,
          phoneNumber: "",
          address: address,
          image: image,
        );
        // Save user info in Firebase
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(userModel.toJson());

        Get.toNamed(signIn);
      } else {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: "Please enter all the fields.",
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: "The password provided is too weak",
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: "The account already exists for that email.",
          ),
        );
      } else if (e.code == 'invalid-email') {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: "Please enter a valid email.",
          ),
        );
      }
    } catch (e) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: e.toString(),
        ),
      );
    }
  }

  //!--------------for user login------------
  Future<void> userLogin(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // !------admin login------------
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        var authCredential = userCredential.user;
        if (authCredential!.uid.isNotEmpty) {
          if (authCredential.emailVerified) {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                message: "Login Successful",
              ),
            );
            Get.toNamed(home_screen);
          } else {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(
                message:
                    "Email not verified. Please check your email and verify",
              ),
            );
          }
        } else {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: "Something went wrong!",
            ),
          );
        }
      } else {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: "Please enter all the fields",
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: "No user found for that email",
          ),
        );
      } else if (e.code == 'wrong-password') {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: "Wrong password provided for that user.",
          ),
        );
      } else if (e.code == 'invalid-email') {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: "Please enter a valid email.",
          ),
        );
      }
    } catch (e) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: 'Error: $e',
        ),
      );
    }
  }

// !-----------------------Google Login------------
  Future signInWithGoogle(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential _userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    User? _user = _userCredential.user;

    if (_user!.uid.isNotEmpty) {
      UserModel userModel = UserModel(
        uid: _user.uid,
        name: _user.displayName.toString(),
        email: _user.email.toString(),
        phoneNumber: "",
        address: "",
        image: "",
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_user.uid)
          .set(userModel.toJson());
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Google Login Successfull",
        ),
      );
      Get.toNamed(home_screen);
    } else {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Sometimes is wrong",
        ),
      );
    }
  }
}
