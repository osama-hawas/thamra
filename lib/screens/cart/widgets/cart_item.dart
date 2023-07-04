import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/main_text_style.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
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
        children: [
          Container(
            alignment: AlignmentDirectional.centerStart,
            height: 78.h,
            width: 92.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/item.png"),
                  fit: BoxFit.scaleDown),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(
            width: 9.w,
          ),
          Column(
            children: [
              MainTextStyle(text: "طماطم"),
              SizedBox(
                height: 4.h,
              ),
              Text("45" + "ر.س",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor)),
              SizedBox(
                height: 4.h,
              ),
              Container(
                padding: EdgeInsets.all(2.r),
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
                          height: 10.w,
                          width: 10.w,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        "5",
                        style: TextStyle(
                            fontSize: 11.sp,
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
                          height: 10.w,
                          width: 10.w,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: Color(0xffFFD4D4),
              ),
              child: SvgPicture.asset(
                "assets/icons/delete.svg",
                height: 13.5.w,
                width: 13.5.w,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
