import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/design/main_button.dart';
import 'package:thamra/core/logic/helper_methods.dart';
import 'package:thamra/screens/cart/view.dart';

import 'package:thamra/screens/product/widgets/custom_product_rate.dart';

import '../../core/design/main_product_item.dart';
import '../../core/design/main_text_style.dart';
import '../../features/add_to_cart/bloc.dart';
import '../../features/get_product/bloc.dart';
import '../../features/is_fav/bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.productData}) : super(key: key);
  final ProductData productData;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final bloc = KiwiContainer().resolve<GetProductsBloc>()
    ..add(GetProductEvent());

  final isFavBloc = KiwiContainer().resolve<IsFavBloc>();
  final addToCartBloc = KiwiContainer().resolve<AddToCartBloc>();

  int count = 1;
  late bool isFav;

  @override
  void initState() {
    super.initState();
    isFav = widget.productData.isFavorite;
  }

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
                        Navigator.pop(context);
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
                          'assets/icons/png/right.png',
                          height: 6.h,
                          width: 12.w,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    const Spacer(),
                    BlocBuilder(
                      bloc: isFavBloc,
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            isFav = !isFav;
                            isFavBloc.id = widget.productData.id;
                            if (isFav) {
                              isFavBloc.endPoint = "add_to_favorite";
                            } else {
                              isFavBloc.endPoint = "remove_from_favorite";
                            }
                            isFavBloc.add(IsFavEvent());
                          },
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
                              child: Icon(
                                isFav
                                    ? Icons.favorite
                                    : Icons.favorite_border_rounded,
                                color: Theme.of(context).primaryColor,
                              )),
                        );
                      },
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
                        MainTextStyle(
                            text: widget.productData.title, fontSize: 22),
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
                                onTap: () {
                                  ++count;
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.all(7.r),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.r),
                                      color: Colors.white),
                                  child: Image.asset(
                                    "assets/icons/png/add.png",
                                    height: 12.w,
                                    width: 12.w,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                                      borderRadius: BorderRadius.circular(7.r),
                                      color: Colors.white),
                                  child: Image.asset(
                                    "assets/icons/png/minus.png",
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
                    const MainTextStyle(text: "كود المنتج :", fontSize: 17),
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
                    const MainTextStyle(text: "تفاصيل المنتج", fontSize: 17),
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
                        const MainTextStyle(text: "التقييمات", fontSize: 17),
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
                      child: const MainTextStyle(
                          text: "منتجات مشابهة", fontSize: 17),
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
        bottomNavigationBar: BlocConsumer(
          bloc: addToCartBloc,
          listener: (context, state) async {
            if (state is AddToCartSuccessState) {
              await _addProductToCart(widget.productData);
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                addToCartBloc.productId = widget.productData.id;
                addToCartBloc.amount = count;
                addToCartBloc.add(AddToCartEvent());
              },
              child: Container(
                height: 60.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                color: Theme.of(context).primaryColor,
                child: Row(
                  children: [
                    SizedBox(
                      width: 7.w,
                    ),
                    Image.asset(
                      "assets/icons/png/cart_item.png",
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "إضافة إلي السلة",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      "${widget.productData.price * count}" "ر.س",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<dynamic> _addProductToCart(ProductData productData) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(38.r), topLeft: Radius.circular(38.r))),
      builder: (context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        height: 202.h,
        width: double.infinity,
        child: Column(children: [
          Row(
            children: [
              Container(
                height: 32.w,
                width: 32.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.r),
                    color: Theme.of(context).primaryColor.withOpacity(.13)),
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Text(
                "تم إضافة المنتج بنجاح",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(
            height: 10.h,
          ),
          Row(
            children: [
              Container(
                height: 65.h,
                width: 69.w,
                clipBehavior: Clip.antiAlias,
                alignment: AlignmentDirectional.topEnd,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(productData.mainImage),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
              SizedBox(
                width: 11.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productData.title,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "الكمية : $count",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "${productData.price * count} ر.س ",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ],
          ),
          Divider(
            height: 10.h,
          ),
          SizedBox(
            height: 13.h,
          ),
          Row(
            children: [
              Expanded(
                child: MainButton(
                    text: "التحويل إلى السلة",
                    onPressed: () {
                      navigateTo(context, route: const CartScreen());
                    }),
              ),
              Expanded(
                child: MainButton(
                  text: "تصفح العروض",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  type: BtnType.outLine,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
