// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_application/constant/app_colors.dart';
import 'package:tour_application/constant/app_string.dart';
import 'package:tour_application/route/route.dart';
import 'package:tour_application/theme/theme_manager.dart';
import 'package:get/get.dart';
import 'views/splash screen/splash_screen.dart';

// themeManager.themeMode == ThemeMode.light? Colors.black : Colors.white

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(App());
}

ThemeManager themeManager = ThemeManager(ThemeMode.light);

class App extends StatelessWidget {
  //! Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    name: "Shelter",
    options: FirebaseOptions(
        apiKey: "AIzaSyBYUYF_fcGP7uyCxjlxTw_-sJZjZnCiX6c",
        appId: "1:347025144572:android:b4a141bf44cc4ad3cfb579",
        messagingSenderId: "347025144572",
        projectId: "tour_application-57625"),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      //! Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,

          // !--------App title -------------
          title: AppString.AppName,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme.apply()),
              scaffoldBackgroundColor: AppColors.scaffoldColor,
              appBarTheme: AppBarTheme(
                  elevation: 0,
                  color: Colors.transparent,
                  iconTheme: IconThemeData(color: Colors.black),
                  titleTextStyle:
                      TextStyle(color: Colors.black, fontSize: 20.sp))),
          initialRoute: splash,
          getPages: getPages,

          // !-----------splash screen-----------------

          home: SplashScreen(),
        );
      },
    );
  }
}