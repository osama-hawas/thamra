import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thamra/core/design/custom_app_bar_profile.dart';
import 'package:thamra/core/design/main_button.dart';
import 'package:thamra/core/design/main_text_field.dart';
import 'package:thamra/core/design/main_text_style.dart';
import 'package:thamra/core/logic/app_routes.dart';
import 'package:thamra/screens/home_pages/home/widgets/address_bottom_sheet.dart';

class CompletingOrderScreen extends StatelessWidget {
  const CompletingOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarProfile(title: "إتمام الطلب"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(
            height: 30.h,
          ),
          const MainTextStyle(text: "الإسم : محمد"),
          SizedBox(
            height: 10.h,
          ),
          const MainTextStyle(text: "الجوال : 05068285914"),
          SizedBox(
            height: 37.h,
          ),
          Row(
            children: [
              Text(
                "اختر عنوان التوصيل",
                style: TextStyle(
                    fontSize: 17.sp,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w900),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.addAddress);
                },
                child: Container(
                  height: 26.w,
                  width: 26.w,
                  padding: EdgeInsets.all(7.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      color: Theme.of(context).primaryColor.withOpacity(.16)),
                  child: Image.asset(
                    "assets/icons/png/add.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18.h,
          ),
          GestureDetector(
            onTap: () {
              showModelBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.r),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Row(
                children: [
                  MainTextStyle(text: "المنزل : 119 طريق الملك عبدالعزيز"),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          Text(
            "تحديد وقت التوصيل",
            style: TextStyle(
                fontSize: 17.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 13.w,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: Theme.of(context).hintColor.withOpacity(.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "اختر اليوم والتاريخ",
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Image.asset(
                        "assets/icons/png/day_cart.png",
                        height: 17.w,
                        width: 17.w,
                        fit: BoxFit.scaleDown,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: Theme.of(context).hintColor.withOpacity(.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "اختر اليوم والتاريخ",
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Image.asset(
                        "assets/icons/png/day_cart.png",
                        height: 17.w,
                        width: 17.w,
                        fit: BoxFit.scaleDown,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 22.h,
          ),
          Text(
            "ملاحظات وتعليمات",
            style: TextStyle(
                fontSize: 17.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 7.h,
          ),
          MainTextField(
            text: "",
            minLines: 5,
          ),
          Text(
            "اختر طريقة الدفع",
            style: TextStyle(
                fontSize: 17.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 19.h,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50.h,
                  width: 104.w,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: Theme.of(context).hintColor.withOpacity(.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/png/kash.png",
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      const MainTextStyle(text: "كاش"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Container(
                  height: 50.h,
                  width: 104.w,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: Theme.of(context).hintColor.withOpacity(.5),
                    ),
                  ),
                  child: Image.asset(
                    "assets/icons/png/visa.png",
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Container(
                  height: 50.h,
                  width: 104.w,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    border: Border.all(
                      color: Theme.of(context).hintColor.withOpacity(.5),
                    ),
                  ),
                  child: Image.asset(
                    "assets/icons/png/mastrcard.png",
                    fit: BoxFit.scaleDown,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            "اختر طريقة الدفع",
            style: TextStyle(
                fontSize: 17.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            padding: EdgeInsets.all(9.r),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.r),
                color: const Color(0xffF3F8EE)),
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
                    const Spacer(),
                    Text(
                        "4000"
                        "ر.س",
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
                    const Spacer(),
                    Text(
                        "-50"
                        "ر.س",
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
                      "الخصم",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    const Spacer(),
                    Text(
                        "-50"
                        "ر.س",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor)),
                  ],
                ),
                const Divider(
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
                    const Spacer(),
                    Text(
                        "300"
                        "ر.س",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          MainButton(text: "إنهاء الطلب", onPressed: () {}),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
