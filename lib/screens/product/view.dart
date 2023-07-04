import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:thamra/core/widgets/main_text_style.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300.h,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                alignment: AlignmentDirectional.topEnd,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/item.png"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(40.r),
                      bottomEnd: Radius.circular(40.r),
                    )),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                      child: Container(
                        height: 32.w,
                        width: 32.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 10.h),
                        margin:
                            EdgeInsetsDirectional.only(top: 22.h, bottom: 8.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.r),
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(.13)),
                        child: Image.asset(
                          'assets/icons/Arrow - Right 2.png',
                          height: 6.h,
                          width: 12.w,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 32.w,
                        width: 32.w,
                        margin: EdgeInsetsDirectional.only(
                            start: 16.w, top: 22.h, bottom: 8.h),
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.r),
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(.13)),
                        child: SvgPicture.asset(
                          'assets/icons/home_svg/Icon ionic-ios-heart-empty.svg',
                          fit: BoxFit.scaleDown,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MainTextStyle(text: "طماطم"),
                        Spacer(),
                        Text(
                          "40%",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "45ر.س",
                          style: TextStyle(
                              fontSize: 17.sp,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "65ر.س",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'السعر / 1كجم',
                          style: TextStyle(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).hintColor),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(3.r),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.1)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(7.r),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.r),
                                      color: Colors.white),
                                  child: Image.asset(
                                    "assets/icons/add.png",
                                    height: 12.w,
                                    width: 12.w,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text(
                                  "5",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(7.r),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.r),
                                      color: Colors.white),
                                  child: Image.asset(
                                    "assets/icons/minus.png",
                                    height: 12.w,
                                    width: 12.w,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 19.5.h,
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                child: Row(
                  children: [
                    MainTextStyle(text: "كود المنتج :"),
                    SizedBox(
                      width: 14.w,
                    ),
                    Text(
                      '58248',
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    MainTextStyle(text: "تفاصيل المنتج"),
                    SizedBox(height: 10.h),
                    Text(
                      "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، ",
                      style: TextStyle(
                          fontSize: 14.sp, color: Theme.of(context).hintColor),
                    ),SizedBox(height: 16.h,),
                    MainTextStyle(text: "التقييمات"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
