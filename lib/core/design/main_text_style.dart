import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTextStyle extends StatelessWidget {
  final String text;
  final double fontSize;

  const MainTextStyle({Key? key, required this.text, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor),
    );
  }
}
