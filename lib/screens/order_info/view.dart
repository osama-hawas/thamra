import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thamra/core/widgets/custom_app_bar_profile.dart';
import 'package:thamra/core/widgets/main_text_style.dart';

import '../../core/widgets/main_button.dart';

class OrderInfoScreen extends StatefulWidget {
  const OrderInfoScreen({Key? key}) : super(key: key);

  @override
  State<OrderInfoScreen> createState() => _OrderInfoScreenState();
}

class _OrderInfoScreenState extends State<OrderInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: CustomAppBarProfile(title: "تفاصيل الطلب"),
          preferredSize: Size(double.infinity, 70.h),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.016),
                        offset: Offset(0, 6),
                        blurStyle: BlurStyle.inner,
                        blurRadius: 17,
                      )
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "طلب #555",
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                          textDirection: TextDirection.ltr,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          DateTime.now().timeZoneName,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).hintColor),
                        ),
                        SizedBox(
                          height: 14.5.h,
                        ),
                        Row(
                          children: [
                            ...List.generate(
                              3,
                              (i) => Container(
                                height: 25.w,
                                width: 25.w,
                                margin: EdgeInsets.symmetric(horizontal: 2.w),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/t1.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(11.r),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 25.w,
                              width: 25.w,
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              decoration: BoxDecoration(
                                color: Color(0xffEDF5E6),
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "+2",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 3.h),
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                            color: Color(0xffEDF5E6),
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "بانتظار الموافقه ",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 31.5.h,
                        ),
                        Text("200" + "ر.س",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 16.w),
                child: MainTextStyle(text: "عنوان التوصيل"),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.016),
                        offset: Offset(0, 6),
                        blurStyle: BlurStyle.inner,
                        blurRadius: 17,
                      )
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "المنزل",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "شقة 40",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).hintColor),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "شارع العليا الرياض 12521السعودية",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      "assets/images/map_order.svg",
                      height: 62.h,
                      width: 72.w,
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 16.w),
                child: MainTextStyle(text: "ملخص الطلب"),
              ),
              SizedBox(
                height: 19.h,
              ),
              Container(
                padding: EdgeInsets.all(9.r),
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.r),
                    color: Color(0xffF3F8EE)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "إجمالي المنتجات",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                        Spacer(),
                        Text("180" + "ر.س",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor)),
                      ],
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "سعر التوصيل",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                        Spacer(),
                        Text("180" + "ر.س",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor)),
                      ],
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Divider(
                      thickness: .5,
                    ),
                    SizedBox(
                      height: 8.5.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "المجموع",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                        Spacer(),
                        Text("180" + "ر.س",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor)),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Divider(
                      thickness: .5,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Center(
                      child: Text(
                        "تم الدفع بواسطة  " + "كاش",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 16.r),
          child: MainButton(
              text: "إلغاء الطلب", onPressed: () {}, type: BtnType.cansle),
        ),
      ),
    );
  }
}
