import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/fav/model.dart';

class MainProductItem extends StatelessWidget {
  const MainProductItem({Key? key, required this.favProductData})
      : super(key: key);
  final  favProductData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  alignment: AlignmentDirectional.topEnd,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(favProductData.mainImage),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadiusDirectional.only(
                            bottomStart: Radius.circular(7.r))),
                    child: Text("%" + "${favProductData.discount * 100}",
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
                    TextSpan(text: "${favProductData.title}\n"),
                    TextSpan(
                        text: "السعر / ${favProductData.unit.name}\n",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).hintColor)),
                    TextSpan(
                        text: "${favProductData.price}" + "ر.س",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).primaryColor)),
                    TextSpan(
                        text: "${favProductData.priceBeforeDiscount}" + "ر.س",
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
            ],
          ),
        ),
      ),
    );
  }
}
