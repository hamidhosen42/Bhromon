// // ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:tour_application/widgets/violetButton.dart';

// import '../route/route.dart';

// class PrivacyPolicy extends StatelessWidget {
//   PdfViewerController? _pdfViewerController;
//   RxBool _loaded = false.obs;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: Padding(
//               padding: EdgeInsets.only(
//                   left: 15.w, right: 15.w, top: 30.h, bottom: 50.h),
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: SfPdfViewer.network(
//                       'https://firebasestorage.googleapis.com/v0/b/tour_application-57625.appspot.com/o/privacy%20policy%2Fprivacy-policy.pdf?alt=media&token=047c5c12-206f-47eb-817b-8809286b204f',
//                       onDocumentLoaded: (PdfDocumentLoadedDetails details) {
//                         _loaded.value = true;
//                       },
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: 30.h,
//                   // ),
//                   Obx(
//                 () => _loaded == true
//                     ? VioletButton(
//                         "Agree",
//                         () => Get.toNamed(mainHomeScreen),
//                       )
//                     : Text('Still Loading'),
//               ),
//               SizedBox(
//                     height: 10.h,
//                   ),
//                 ],
//               ))),
//     );
//   }
// }
