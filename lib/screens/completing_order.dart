import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thamra/core/design/custom_app_bar_profile.dart';
import 'package:thamra/core/design/main_text_style.dart';
import 'package:thamra/core/logic/app_routes.dart';

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
            Container(
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
            ), SizedBox(
              height: 32.h,
            ),
            Text(
              "تحديد وقت التوصيل",
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ));
  }
}
