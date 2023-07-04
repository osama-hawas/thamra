import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:thamra/core/utils/app_routes.dart';

import 'address_bottom_sheet.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // height: 70,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 24.h,
            width: 24.r,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 2.w),
            child: Text(
              'سلة ثمار',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                showModelBottomSheet(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'التوصيل إلى',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 12.sp,
                        color: Theme.of(context).primaryColor),
                  ),
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      'شارع الملك فهد - جدة',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          Badge(
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRoutes.cart);
              },
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Color(0xff4C8613).withOpacity(.13)),
                  child: SvgPicture.asset("assets/icons/cart-home.svg")),
            ),
            badgeStyle: BadgeStyle(
              badgeColor: Theme.of(context).primaryColor,
            ),
            badgeContent: Text(
              '3',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.bold),
            ),
            position: BadgePosition.custom(start: 2.w, top: -11.h),
          ),
        ],
      ),
    );
  }
}
