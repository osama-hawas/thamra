import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/screens/product/view.dart';

class MainProductItem extends StatelessWidget {
  const MainProductItem({Key? key, required this.productData})
      : super(key: key);
  final productData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductScreen(productData: productData),
              ));
        },
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Container(
            // height: 172.h,
            // width: 130.h,
            padding: EdgeInsets.all(2.r),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 3),
                  blurRadius: 14,
                  color: Colors.grey.withOpacity(.16),
                  blurStyle: BlurStyle.outer)
            ], borderRadius: BorderRadius.circular(17.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Expanded(
            child: Container(
            clipBehavior: Clip.antiAlias,
              alignment: AlignmentDirectional.topEnd,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productData.mainImage),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
                  decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(7.r))),
                  child: Text("%" "${((productData.discount) * 100).toInt()}",
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
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text.rich(
              TextSpan(children: [
                TextSpan(text: "${productData.title}\n"),
                TextSpan(
                    text: "السعر / ${productData.unit.name}\n",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Theme
                            .of(context)
                            .hintColor)),
                TextSpan(
                    text: "${productData.price}" "ر.س",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                        color: Theme
                            .of(context)
                            .primaryColor)),
                TextSpan(
                    text: "${productData.priceBeforeDiscount}" "ر.س",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 1.5,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff61B80C))),
              ]),
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w900,
                  color: Theme
                      .of(context)
                      .primaryColor)),
        ),
        SizedBox(
          height: 19.h,
        ),
        ],
      ),
    ),)
    ,
    )
    ,
    );
  }
}
