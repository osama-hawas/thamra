import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/core/widgets/btn.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: double.minPositive,
          childAspectRatio: 163 / 250),
      itemBuilder: ((context, index) => GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(clipBehavior: Clip.antiAlias,
                      alignment: AlignmentDirectional.topEnd,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/item.png"),fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 1.h),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadiusDirectional.only(
                                bottomStart: Radius.circular(7.r))),
                        child: Text("45%",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w900,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text.rich(
                      TextSpan(children: [
                        TextSpan(text: "طماطم\n"),
                        TextSpan(
                            text: "السعر / 1كجم\n",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).hintColor)),
                        TextSpan(
                            text: "45" + "ر.س",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).primaryColor)),
                        TextSpan(
                            text: "45" + "ر.س",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 1.5,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff61B80C))),
                      ]),
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).primaryColor)),
                  SizedBox(
                    height: 19.h,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("أضف للسلة"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff61B80C),
                        foregroundColor: Colors.white,
                        alignment: Alignment.center,
                        textStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800,
                        ),
                        elevation: 0,
                        minimumSize: Size(115.w, 30.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

// Container
// (
//
// padding:
// EdgeInsetsDirectional.only(start: 9.w, top: 9.h, end: 9.w),
// margin: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisSize: MainAxisSize.min,
// children: [
// Container(clipBehavior:Clip.antiAlias,
// decoration: BoxDecoration(
// borderRadius: BorderRadiusDirectional.only(
// bottomStart: Radius.circular(11)),
// ),
// height: 117.h,
// width: 145.w,
// child: Stack(
//
// alignment: AlignmentDirectional.topEnd,
// children: [
// Image.asset(
// "assets/images/item.png",
// fit: BoxFit.scaleDown,
// ),
// Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadiusDirectional.only(
// bottomStart: Radius.circular(7.r)),
// color: Theme.of(context).primaryColor,
// ),
// child: Text(
// 'طماطم',
// style: TextStyle(
// fontSize: 16.sp,
// fontWeight: FontWeight.bold,
// color: Theme.of(context).primaryColor),
// ),
// ),
// ]),
// ),
// Padding(
// padding: EdgeInsetsDirectional.only(top: 2.h, start: 1.w),
// child: Text(
// 'طماطم',
// style: TextStyle(
// fontSize: 16.sp,
// fontWeight: FontWeight.bold,
// color: Theme.of(context).primaryColor),
// ),
// ),
// Padding(
// padding: EdgeInsetsDirectional.only(start: 1.w),
// child: Text(
// 'السعر / 1كجم',
// style: TextStyle(
// fontSize: 12,
// fontWeight: FontWeight.w400,
// color: Color(0xff808080),
// ),
// ),
// ),
// Row(
// children: [
// Text(
// '45ر.س',
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// color: Theme.of(context).primaryColor),
// ),
// const SizedBox(
// width: 2,
// ),
// Text(
// '56ر.س',
// style: TextStyle(
// fontSize: 13,
// decoration: TextDecoration.lineThrough,
// color: Theme.of(context).primaryColor),
// ),
// const Spacer(),
// ],
// ),
// const SizedBox(
// height: 12,
// ),
// Container(
// margin: EdgeInsets.symmetric(horizontal: 24.w),
// alignment: AlignmentDirectional.center,
// padding: EdgeInsetsDirectional.only(
// top: 8.h,
// bottom: 4.h,
// ),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(9.r),
// color: const Color(0xff61B80C)),
// child: FittedBox(
// fit: BoxFit.scaleDown,
// child: Text(
// 'أضف للسلة',
// style: TextStyle(
// fontSize: 12.sp,
// fontWeight: FontWeight.w900,
// color: Colors.white,
// ),
// textAlign: TextAlign.center,
// ),
// ),
// ),
// ],
// ),
// ),
