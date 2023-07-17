import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGrid extends StatelessWidget {
  const ShimmerGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(8.r),
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white10,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(11)),
        ),
      ),
    );
  }
}
