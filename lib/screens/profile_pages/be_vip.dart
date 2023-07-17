import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thamra/core/design/custom_app_bar_profile.dart';

import '../../core/design/main_button.dart';
import '../../core/design/main_text_style.dart';
import '../../core/logic/helper_methods.dart';


class VipScreen extends StatelessWidget {
  const VipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarProfile(title: " VIP تحويل لحساب "),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          children: [
            SizedBox(
              height: 42.h,
            ),
            Center(child: SvgPicture.asset("assets/icons/svg/vip.svg")),
            SizedBox(
              height: 13.h,
            ),
            Text(
              " VIP حساب ",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            Text(
              "150 ر.س/شهريا",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.",
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).hintColor),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 23.w,
                  width: 23.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).primaryColor),
                  padding: EdgeInsets.all(4.r),
                  child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  width: 7.w,
                ),
              const  MainTextStyle(text: "تسوق من المتجر ودفع التكاليف شهريا")
              ],
            ),
            SizedBox(height:19.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 23.w,
                  width: 23.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).primaryColor),
                  padding: EdgeInsets.all(4.r),
                  child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  width: 7.w,
                ),
               const MainTextStyle(text: "تسوق من المتجر ودفع التكاليف شهريا")
              ],
            ),SizedBox(height:19.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 23.w,
                  width: 23.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).primaryColor),
                  padding: EdgeInsets.all(4.r),
                  child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  width: 7.w,
                ),
              const  MainTextStyle(text: "تسوق من المتجر ودفع التكاليف شهريا")
              ],
            ),SizedBox(height:19.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 23.w,
                  width: 23.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).primaryColor),
                  padding: EdgeInsets.all(4.r),
                  child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  width: 7.w,
                ),
              const  MainTextStyle(text: "تسوق من المتجر ودفع التكاليف شهريا")
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(vertical:  16.r),
        child: MainButton(text: "طلب تحويل", onPressed: (){
          showMSG(message: "تم التحويل بنجاح");
        }),
      ),
    );
  }
}
