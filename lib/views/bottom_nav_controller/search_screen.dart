// ignore_for_file: unused_import, implementation_imports, unnecessary_import, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 50.h),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Search for your next tour",
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
