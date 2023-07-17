import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListView extends StatelessWidget {
  const ShimmerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          5,
              (index) => Padding(
            padding: EdgeInsets.all(8.r),
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white10,
              child: Container(
                height: 97.h,
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(11)),
              ),
            ),
          )),
    );
  }
}
