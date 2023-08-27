import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/design/custom_app_bar_profile.dart';
import 'package:thamra/core/design/main_button.dart';
import 'package:thamra/core/logic/helper_methods.dart';
import 'package:thamra/screens/cart/widgets/cart_item.dart';
import 'package:thamra/screens/cart/widgets/cart_text_field.dart';
import 'package:thamra/screens/completing_order.dart';

import '../../features/show_cart/bloc.dart';
import '../shimmers/shimmer_listview.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final showCartBloc = KiwiContainer().resolve<ShowCartBloc>()
    ..add(ShowCartEvent());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBarProfile(title: "السلة"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: BlocBuilder(
              bloc: showCartBloc,
              builder: (context, state) {
                if (state is ShowCartSuccessState ||
                    state is ShowCartOutLoadingState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CartItem(
                          cartData: showCartBloc.cartModel.data,
                          refreshCart: showCartBloc),
                      const CartTextField(),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                              "جميع الأسعار تشمل قيمة الضريبة المضافة 15%",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(9.r),
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
                                Text(
                                    "${showCartBloc.cartModel.totalPriceBeforeDiscount}"
                                    "ر.س",
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
                                  "الخصم",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                                const Spacer(),
                                Text(
                                    "-${(showCartBloc.cartModel.totalDiscount).toInt()}"
                                    "ر.س",
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
                                    "${showCartBloc.cartModel.totalPriceWithVat}"
                                    "ر.س",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).primaryColor)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      MainButton(
                          text: "الانتقال لإتمام الطلب",
                          onPressed: () {
                            if (showCartBloc.cartModel.data.isNotEmpty) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CompletingOrderScreen(
                                        cartModel: showCartBloc.cartModel),
                                  ));
                            } else {
                              showMSG(message: "Cart is Empty");
                            }
                          }),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  );
                } else if (state is ShowCartLoadingState) {
                  return const ShimmerListView();
                } else {
                  return const Text("Failed");
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
