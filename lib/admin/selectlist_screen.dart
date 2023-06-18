// // ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:tour_application/widgets/SeaTours.dart';
// import 'package:tour_application/widgets/HillTours.dart';
// import 'package:tour_application/widgets/tour_widget.dart';

// import '../widgets/ParkTour.dart'rt';

// class SelectList extends StatefulWidget {
//   @override
//   // ignore: no_logic_in_create_state
//   State<SelectList> createState() => _SelectListState();
// }

// class _SelectListState extends State<SelectList> {
//   List<String> items = [
//     "All",
//     "HillTours",
//     "SeaTours",
//     "ParkTours",
//   ];
//   int current = 0;

//   _SelectListState();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           width: double.infinity,
//           height: 60,
//           child: ListView.builder(
//               physics: const BouncingScrollPhysics(),
//               itemCount: items.length,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (ctx, index) {
//                 return Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           current = index;
//                         });
//                       },
//                       child: AnimatedContainer(
//                         duration: const Duration(milliseconds: 300),
//                         margin: const EdgeInsets.all(5),
//                         width: 81,
//                         height: 45,
//                         decoration: BoxDecoration(
//                           borderRadius: current == index
//                               ? BorderRadius.circular(15)
//                               : BorderRadius.circular(10),
//                           border: current == index
//                               ? Border.all(color: Colors.black, width: 2)
//                               : null,
//                         ),
//                         child: Center(
//                           child: Text(
//                             items[index],
//                             style: GoogleFonts.lato(
//                                 fontSize: 16,
//                                 color: current == index
//                                     ? Colors.black
//                                     : Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Visibility(
//                         visible: current == index,
//                         child: Container(
//                           width: 5,
//                           height: 5,
//                           decoration: BoxDecoration(
//                               color: Colors.black, shape: BoxShape.circle),
//                         )),
//                   ],
//                 );
//               }),
//         ),
//         if (current == 0)
//           Consumer(builder: (context, value, _) => TourWidget()),
//         if (current == 1) Consumer(builder: (context, value, _) => HillPlace()),
//         if (current == 2) Consumer(builder: (context, value, _) => SeaPlace()),
//         if (current == 3) Consumer(builder: (context, value, _) => ParkPlace()),
//       ],
//     );
//   }
// }
