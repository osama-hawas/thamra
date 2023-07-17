import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 20.h, bottom: 21.h),
      child: Center(
        child: Image.asset(
          'assets/icons/png/logo.png',
          height: 125.h,
          width: 130.w,
        ),
      ),
    );
  }
}
