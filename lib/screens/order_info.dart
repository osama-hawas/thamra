import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thamra/core/design/custom_app_bar_profile.dart';
import 'package:thamra/features/get_order/bloc.dart';
import '../core/design/main_button.dart';
import '../core/design/main_text_style.dart';

class OrderInfoScreen extends StatefulWidget {
  const OrderInfoScreen({Key? key, required this.orderData, required this.type})
      : super(key: key);
  final OrderData orderData;
  final int? type;

  @override
  State<OrderInfoScreen> createState() => _OrderInfoScreenState();
}

class _OrderInfoScreenState extends State<OrderInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBarProfile(title: "تفاصيل الطلب") ,

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
                        offset: const Offset(0, 6),
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
                          "طلب #${widget.orderData.id}",
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
                          widget.orderData.date,
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
                              widget.orderData.products.length > 3
                                  ? 3
                                  : widget.orderData.products.length,
                              (i) =>
                                  Container(
                                height: 25.w,
                                width: 25.w,
                                margin: EdgeInsets.symmetric(horizontal: 2.w),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        widget.orderData.products[i].url),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(11.r),
                                ),
                              ),
                            ),
                            if (widget.orderData.products.length > 3)
                            Container(
                              alignment: Alignment.center,
                              height: 25.w,
                              width: 25.w,
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              decoration: BoxDecoration(
                                color: const Color(0xffEDF5E6),
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  " ${(widget.orderData.products.length - 3)}""+",
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
                    const Spacer(),
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
                            color: const Color(0xffEDF5E6),
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.orderData.status,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 31.5.h,
                        ),
                        Text("${widget.orderData.totalPrice}" "ر.س",
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
                child: const MainTextStyle(text: "عنوان التوصيل"),
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
                        offset: const Offset(0, 6),
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
                            widget.orderData.location ?? "mansoura",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).hintColor),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            widget.orderData.location ??
                                "شارع العليا الرياض 12521السعودية",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/svg/map_order.svg",
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
                child: const MainTextStyle(text: "ملخص الطلب"),
              ),
              SizedBox(
                height: 19.h,
              ),
              Container(
                padding: EdgeInsets.all(9.r),
                margin: EdgeInsets.symmetric(horizontal: 16.w),
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
                        Text("${widget.orderData.totalPrice}" "ر.س",
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
                        Text("${widget.orderData.deliveryPrice}" "ر.س",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor)),
                      ],
                    ),
                    SizedBox(
                      height: 11.h,
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
                            "${(widget.orderData.totalPrice + widget.orderData.deliveryPrice)}"
                            "ر.س",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor)),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const Divider(
                      thickness: .5,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Center(
                      child: Text(
                        "تم الدفع بواسطة  " "كاش",
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
              text: widget.type == 0 ? "إلغاء الطلب" : "تقييم المنتجات",
              onPressed: () {},
              type: widget.type == 0 ? BtnType.cansle : BtnType.elvated),
        ),
      ),
    );
  }
}
