// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_element, constant_identifier_names, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:bhromon_application/admin/admin_home.dart';
import 'package:bhromon_application/views/auth%20screen/reset_password.dart';
import 'package:bhromon_application/views/auth%20screen/sign_up.dart';
import 'package:bhromon_application/views/home%20screen/home_screen.dart';
import 'package:bhromon_application/views/home%20screen/see-all_park.dart';
import 'package:bhromon_application/views/home%20screen/see_all_sea.dart';
import 'package:bhromon_application/views/home%20screen/see_all_topplace.dart';
import 'package:bhromon_application/views/onboarding%20screen/onboarding_screen.dart';
import 'package:bhromon_application/views/splash%20screen/splash_screen.dart';

import '../admin/nav_home.dart';
import '../views/auth screen/sign_in.dart';
import '../views/bottom_nav_controller/search_screen.dart';
import '../views/drawer_pages/faq_screen.dart';
import '../views/drawer_pages/how_to_use.dart';
import '../views/drawer_pages/privacy_policy_screen.dart';
import '../views/drawer_pages/settings.dart';
import '../views/drawer_pages/support_screen.dart';
import '../views/home screen/see_all_hill.dart';

const String splash = "/splash_screen";
const String onboarding = "/onboarding_screen";
const String signUp = "/sign-up-screen";
const String signIn = "/sign-in-screen";
const String resetPassword = "/reset_password.dart";
const String userForm = "/user-form-screen";
const String privacyPolicy = "/privacy-policy-screen";
const String home_screen = '/home-screen';
const String see_all_topplace = '/see-all-topplace';
const String see_all_hill = '/see-all-hill';
const String see_all_sea = '/see-all-sea';
const String see_all_park ="/see-all-park";
const String supportScreen = '/support-screen';
const String privacyScreen = '/privacy-screen';
const String faqScreen = '/faq-screen';
const String howToUseScreen = '/how-to-use-screen';
const String settingsScreen = '/settings-screen';
const String profileScreen = '/profile-screen';
const String searchScreen = '/search-screen';
const String seeAllScreen = '/seeAll-screen';
const String detailsScreen = '/details-screen';
const String navAddLastStep = '/navAddLastStep-screen';


// !admin-----------------------------
const String adminHome = '/admin_home';


// control our page  route flow
late User _user;
List<GetPage> getPages = [
  GetPage(name: splash, page: () =>SplashScreen()),
  GetPage(name: onboarding, page: () => OnboardingScreen()),
  GetPage(name: signUp, page: () => SignUpScreen()),
  GetPage(name: signIn, page: () => SignInScreen()),
  GetPage(name: resetPassword, page: () => ResetPassword()),
  GetPage(name: see_all_hill, page: () => SeeAllHillPlace()),
  GetPage(name: see_all_topplace, page: () => AllTopPlace()),
  GetPage(name: see_all_sea, page: () => AllSeaPlace()),
  GetPage(name: see_all_park, page: () => SeeAllPark()),
  GetPage(name: supportScreen, page: () => Support()),
  // GetPage(name: userForm, page: () => UserForm()),
  GetPage(name: privacyPolicy, page: () => Privacy()),
  GetPage(
    name: home_screen,
    page: () => HomeScreens(),
  ),
  GetPage(
    name: supportScreen,
    page: () => Support(),
  ),
  GetPage(
    name: privacyScreen,
    page: () => Privacy(),
  ),
  GetPage(
    name: faqScreen,
    page: () =>FAQScreen(),
  ),
  GetPage(
    name: howToUseScreen,
    page: () => HowToUse(),
  ),
    GetPage(
    name: searchScreen,
    page: () => SearchScreen(),
  ),
  // GetPage(
  //   name: profileScreen,
  //   page: () => UserProfile(),
  // ),
    GetPage(
    name: settingsScreen,
    page: () => Settings(),
  ),
  GetPage(
    name: seeAllScreen,
    page: () {
      SeeAllHillPlace _seeAll = Get.arguments;
      return _seeAll;
    },
  ),

  GetPage(name: adminHome, page: ()=>AdminHome()),

  // GetPage(
  //   name: navAddLastStep,
  //   page: () {
  //     NavAddLastStep _addLastStep = Get.arguments;
  //     return _addLastStep;
  //   },
  // ),
];