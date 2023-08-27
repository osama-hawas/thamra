import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/core/design/custom_app_bar_profile.dart';

import '../../core/design/main_text_style.dart';

class PaiementsScreen extends StatelessWidget {
  const PaiementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarProfile(title: "الدفع"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image.asset("assets/icons/png/wallet-visa.PNG"),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image.asset("assets/icons/png/wallet_master.PNG"),
            ),
            SizedBox(
              height: 24.h,
            ),
            DottedBorder(
              strokeWidth: 1,
              borderType: BorderType.RRect,
              color: Theme.of(context).primaryColor,
              radius: Radius.circular(15.r),
              dashPattern: const [4],
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 80.w),
                  color: Theme.of(context).primaryColor.withOpacity(.16),
                  child: const Center(child: MainTextStyle(text: "اشحن الآن",fontSize: 15)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
