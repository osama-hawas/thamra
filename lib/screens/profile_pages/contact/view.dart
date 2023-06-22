import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thamra/core/widgets/btn.dart';
import 'package:thamra/core/widgets/custom_app_bar_profile.dart';
import 'package:thamra/core/widgets/text_under_logo.dart';

import '../../../core/widgets/input.dart';

class ConnectUsScreen extends StatelessWidget {
  const ConnectUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            child: CustomAppBarProfile(title: "تواصل معنا"),
            preferredSize: Size.fromHeight(73.h)),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              SizedBox(
                height: 24.h,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 47.h),
                    alignment: Alignment.topCenter,
                    height: 200.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.r),
                      color: Colors.grey,
                    ),
                    //child: Image.asset("assets/bgImage.jpg"),
                  ),
                  Container(
                      //color: Colors.white,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Container(
                        padding: EdgeInsets.all(15.r),
                        margin: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                offset: Offset(0, 3),
                                blurStyle: BlurStyle.normal,
                                blurRadius: 20,
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(15.r),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/contact_location.svg",
                                  height: 17.w,
                                  width: 17.w,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  child: Text(
                                    "شارع الملك فهد , جدة , المملكة العربية السعودية",
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/contact_phone.svg",
                                  height: 17.w,
                                  width: 17.w,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  child: Text(
                                    "966 054 87452",
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.black),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/contact_email.svg",
                                  height: 17.w,
                                  width: 17.w,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  child: Text(
                                    "info@thimar.com",
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.black),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ],
                        ),
                      )),

                  // Container(
                  //   height: 200.h,
                  //   color: Colors.yellow,
                  // ),
                  //
                ]),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                  child: Text(
                "أو يمكنك إرسال رسالة ",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 32.h,
              ),
              MainTextField(text: "الإسم"),
              MainTextField(text: "رقم الموبايل"),
              MainTextField(text: "الموضوع", minLines: 4),
              MainButton(text: "إرسال", onPressed: () {}),
            ]),
      ),
    );
  }
}