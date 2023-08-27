import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/core/design/custom_app_bar_profile.dart';
import 'package:thamra/core/design/main_button.dart';
import 'package:thamra/core/design/main_text_field.dart';
import 'package:thamra/core/design/main_text_style.dart';

class PaiementNowScreen extends StatelessWidget {
  const PaiementNowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarProfile(title: "شحن الان"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(
            height: 64.h,
          ),
          const MainTextStyle(text: "معلومات المبلغ",fontSize: 15),
          SizedBox(
            height: 8.h,
          ),
          MainTextField(
            text: "المبلغ الخاص بك",
            homeInput: true,
          ),
          SizedBox(
            height: 24.h,
          ),
          const MainTextStyle(text: "معلومات البطاقة",fontSize: 15),
          MainTextField(
            text: "الاسم",
            homeInput: true,
          ),
          MainTextField(
            text: "رقم البطاقة الائتمانية",
            homeInput: true,
          ),
          Row(
            children: [
              Expanded(
                child: MainTextField(
                  text: "تاريخ الانتهاء",
                  homeInput: true,
                ),
              ),
              SizedBox(
                width: 19.w,
              ),
              Expanded(
                child: MainTextField(
                  text: "الرقم المتسلسل",
                  homeInput: true,
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: MainButton(
            text: "دفع",
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
