import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/features/show_cart/bloc.dart';

import '../../../core/design/main_text_style.dart';
import '../../../features/delete_from_cart/bloc.dart';
import '../../../features/update_item_cart_amount/bloc.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key, required this.cartData, required this.refreshCart})
      : super(key: key);
  final List<CartData> cartData;
  final Bloc refreshCart;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final deleteItemBloc = KiwiContainer().resolve<DeleteFromCartBloc>();
  final updateCartBloc = KiwiContainer().resolve<UpdateCartAmountBloc>();

  // late int amount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(widget.cartData.length, (index) {
          int amount = widget.cartData[index].amount;
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
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
              children: [
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  clipBehavior: Clip.antiAlias,
                  height: 78.h,
                  width: 92.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.cartData[index].image),
                        fit: BoxFit.scaleDown),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                SizedBox(
                  width: 9.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTextStyle(text: widget.cartData[index].title,fontSize: 16),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text("${widget.cartData[index].price}" "ر.س",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor)),
                    SizedBox(
                      height: 4.h,
                    ),
                    BlocConsumer(
                      listener: (context, state) {
                        if (state is UpdateCartAmountSuccessState) {
                          widget.refreshCart
                              .add(ShowCartEvent(isOutLoading: true));
                        }
                      },
                      bloc: updateCartBloc,
                      builder: (context, state) {
                        return StatefulBuilder(
                          builder: (context, setState) => Container(
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
                                  onTap: () async {
                                    if (amount <
                                        widget
                                            .cartData[index].remainingAmount) {
                                      ++amount;
                                      updateCartBloc.add(UpdateCartAmountEvent(
                                          id: widget.cartData[index].id,
                                          amount: amount));
                                    }

                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(7.r),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        color: Colors.white),
                                    child: Image.asset(
                                      "assets/icons/png/add.png",
                                      height: 10.w,
                                      width: 10.w,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(
                                    "$amount",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (amount > 1) {
                                      --amount;

                                      updateCartBloc.add(UpdateCartAmountEvent(
                                          id: widget.cartData[index].id,
                                          amount: amount));
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
                                      "assets/icons/png/minus.png",
                                      height: 10.w,
                                      width: 10.w,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const Spacer(),
                BlocBuilder(
                  bloc: deleteItemBloc,
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        deleteItemBloc.add(
                            DeleteFromCartEvent(id: widget.cartData[index].id));
                        widget.cartData.removeAt(index);

                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          color: const Color(0xffFFD4D4),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/svg/delete.svg",
                          height: 13.5.w,
                          width: 13.5.w,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
