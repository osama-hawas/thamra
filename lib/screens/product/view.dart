import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';

import 'package:thamra/screens/product/widgets/custom_product_rate.dart';


import '../../core/design/main_product_item.dart';
import '../../core/design/main_text_style.dart';
import '../../features/get_product/bloc.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.productData}) : super(key: key);
  final ProductData productData;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final bloc = KiwiContainer().resolve<GetProductsBloc>()
    ..add(GetProductEvent());
  int count = 1;

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
                        image: NetworkImage(widget.productData.mainImage),
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
                    const Spacer(),
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
                        MainTextStyle(text: widget.productData.title),
                        const Spacer(),
                        Text(
                          "${((widget.productData.discount) * 100).toInt()}%",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "${widget.productData.price}ر.س",
                          style: TextStyle(
                              fontSize: 17.sp,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "${widget.productData.priceBeforeDiscount}ر.س",
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
                          'السعر / ${widget.productData.unit.name}',
                          style: TextStyle(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).hintColor),
                        ),
                        const Spacer(),
                        StatefulBuilder(
                          builder: (context, setState) => Container(
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
                                  onTap: () {
                                    ++count;
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(7.r),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Text(
                                    count.toString(),
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (count > 1) {
                                      --count;
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(7.r),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
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
                  const  MainTextStyle(text: "كود المنتج :"),
                    SizedBox(
                      width: 14.w,
                    ),
                    Text(
                      widget.productData.code,
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
                  const  MainTextStyle(text: "تفاصيل المنتج"),
                    SizedBox(height: 10.h),
                    Text(
                      widget.productData.description,
                      style: TextStyle(
                          fontSize: 14.sp, color: Theme.of(context).hintColor),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       const MainTextStyle(text: "التقييمات"),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "عرض الكل",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    const CustomProductRate(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child:const MainTextStyle(text: "منتجات مشابهة"),
                    ),
                    BlocBuilder(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is GetProductsSuccessState) {
                          return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    state.list.length,
                                    (index) => SizedBox(
                                          height: 200.h,
                                          width: 130.w,
                                          child: MainProductItem(
                                              productData: state.list[index]),
                                        )),
                              ));
                        } else {
                          return const Text("data");
                        }
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60.h,
          color: Theme.of(context).primaryColor,
          child: Row(
            children: const [

            ],
          ),
        ),
      ),
    );
  }
}
