import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/core/widgets/custom_app_bar_profile.dart';
import 'package:thamra/core/widgets/text_under_logo.dart';

class ChangeLangScreen extends StatefulWidget {
  ChangeLangScreen({Key? key}) : super(key: key);

  @override
  State<ChangeLangScreen> createState() => _ChangeLangScreenState();
}

class _ChangeLangScreenState extends State<ChangeLangScreen> {
  bool isMarked = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBarProfile(title: "تغير اللغة"),
            SizedBox(
              height: 64.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUnderLogo(text: "العربية"),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      isMarked = true;
                      setState(() {});
                    },
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: isMarked
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).hintColor,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 8,
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
                  TextUnderLogo(text: "English"),
                  Spacer(),
                  InkWell(
                    onTap: () {
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
            )
          ],
        ),
      ),
    );
  }
}
