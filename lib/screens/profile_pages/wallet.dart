import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thamra/core/design/custom_app_bar_profile.dart';
import 'package:thamra/core/design/main_button.dart';
import 'package:thamra/core/design/main_text_style.dart';
import 'package:thamra/core/logic/app_routes.dart';

import '../../core/design/wallet_item.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarProfile(title: "المحفظة"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(
            height: 70.h,
          ),
          Center(
            child: Text(
              "رصيدك",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
          Center(
            child: Text(
              "255 ر.س",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.paiementNowScreen);
            },
            child: DottedBorder(
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
                  child: const Center(child: MainTextStyle(text: "اشحن الآن")),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          Row(
            children: [
              const MainTextStyle(text: "سجل المعاملات"),
              Spacer(),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.transactionHistory);
                },
                child: Text(
                  "عرض الكل",
                  style: TextStyle(
                      fontSize: 15.sp, color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
          ...List.generate(5, (index) => WalletItem())
        ],
      ),
    );
  }
}
