import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTextStyle extends StatelessWidget {
  final String text;
  const MainTextStyle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      textDirection: TextDirection.ltr,
      style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor),
    );
  }
}
