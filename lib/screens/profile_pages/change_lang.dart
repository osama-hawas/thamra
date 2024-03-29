
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/core/design/custom_app_bar_profile.dart';

import '../../core/design/main_text_style.dart';

class ChangeLangScreen extends StatefulWidget {
  const ChangeLangScreen({Key? key}) : super(key: key);

  @override
  State<ChangeLangScreen> createState() => _ChangeLangScreenState();
}

class _ChangeLangScreenState extends State<ChangeLangScreen> {
  bool isMarked =  true;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBarProfile(title: "تغير اللغة"),
            SizedBox(
              height: 64.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const  MainTextStyle(text: "العربية",fontSize: 16),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.setLocale(const Locale('ar'));
                      isMarked = true;
                      setState(() {});
                    },
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundColor: isMarked
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).hintColor,
                      child: CircleAvatar(
                        radius: 10.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 8.r,
                          backgroundColor: isMarked
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const  MainTextStyle(text: "English",fontSize: 16),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.setLocale(const Locale('en'));

                      isMarked = false;
                      setState(() {});
                    },
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: isMarked
                          ? Theme.of(context).hintColor
                          : Theme.of(context).primaryColor,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: isMarked
                              ? Theme.of(context).hintColor
                              : Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text("hello".tr()),
          ],
        ),
      ),
    );
  }
}
