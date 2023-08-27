import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thamra/core/logic/helper_methods.dart';
import 'package:thamra/screens/cart/view.dart';

import '../../../../core/logic/cache_helper.dart';
import '../../../../features/get_addresses/bloc.dart';
import 'address_bottom_sheet.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  AddressData? addressData;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Container(
        alignment: Alignment.center,
        // height: 70,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/png/logo.png',
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
                onTap: () async {
                  addressData = await showModelBottomSheet(context);
                  if (addressData != null) {
                    CacheHelper.saveLocation(
                        location: addressData!.location.toString());
                    CacheHelper.saveLocationId(
                        locationId: addressData!.id.toString());
                  }
                  setState(() {});
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
                      fit: BoxFit.scaleDown,
                      child: Text(
                        addressData != null
                            ? addressData!.location.toString()
                            : CacheHelper.getLocation() ??
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
            GestureDetector(
              onTap: () {
                navigateTo(context, route:const CartScreen());
              },
              child: Badge(
                badgeStyle: BadgeStyle(
                  badgeColor: Theme.of(context).primaryColor,
                ),
                position: BadgePosition.custom(start: -5.w, top: -11.h),
                badgeContent: Text(
                  "${CacheHelper.getCartCount()}",
                  style: TextStyle(fontSize: 6.sp, color: Colors.white),
                ),
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Theme.of(context).primaryColor.withOpacity(.13)),
                    child: SvgPicture.asset("assets/icons/svg/cart-home.svg")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
