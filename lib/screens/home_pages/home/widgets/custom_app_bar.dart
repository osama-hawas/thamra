import 'package:badges/badges.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thamra/core/widgets/text_under_logo.dart';

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
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(38.r),
                                topLeft: Radius.circular(38.r))),
                        context: context,
                        builder: (context) => Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(38.r),
                              topLeft: Radius.circular(38.r),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 14.h,
                              ),
                              MainTextStyle(text: "العناوين"),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(
                                      2,
                                      (index) => Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 16.w, vertical: 20.h),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.w, vertical: 2.h),
                                        height: 100,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                MainTextStyle(text: "المنزل"),
                                                Text.rich(TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            "العنوان : 119 طريق الملك عبدالعزيز'\n"),
                                                    TextSpan(
                                                        text: "الوصف\n",
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .hintColor)),
                                                    TextSpan(
                                                        text: "رقم الجوال",
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .hintColor))
                                                  ],
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontSize: 14.sp),
                                                )),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 9.h),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(6.r),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7.r),
                                                        color:
                                                            Color(0xffFFD4D4),
                                                      ),
                                                      child: SvgPicture.asset(
                                                        "assets/icons/delete.svg",
                                                        height: 13.5.w,
                                                        width: 13.5.w,
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(6.r),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7.r),
                                                        color: Theme.of(context)
                                                            .primaryColor
                                                            .withOpacity(.13),
                                                      ),
                                                      child: SvgPicture.asset(
                                                        "assets/icons/edit.svg",
                                                        height: 13.5.w,
                                                        width: 13.5.w,
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              InkWell(
                                onTap: () {},
                                child: DottedBorder(
                                  strokeWidth: 1,
                                  borderType: BorderType.RRect,
                                  color: Theme.of(context).primaryColor,
                                  radius: Radius.circular(15.r),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.r)),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16.h, horizontal: 100.w),
                                      child: MainTextStyle(
                                          text: "إضافة عنوان جديد"),
                                      color: Color(0xffF9FCF5),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'شارع الملك فهد - جدة',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Badge(
            child: GestureDetector(
              onTap: () {},
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
