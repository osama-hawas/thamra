import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shimmer/shimmer.dart';

import 'package:thamra/features/add_to_cart/bloc.dart';



import '../../../../features/get_product/bloc.dart';

import '../../../product/view.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  final productItemBloc = KiwiContainer().resolve<GetProductsBloc>()
    ..add(GetProductEvent());
  final addToCartBloc = KiwiContainer().resolve<AddToCartBloc>();
  late int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: productItemBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state is GetProductsSuccessState ? state.list.length : 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: double.minPositive,
                childAspectRatio: 163 / 250),
            itemBuilder: ((context, index) {
              if (state is GetProductsSuccessState) {
                id = state.list[index].categoryId;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(productData: state.list[index]),
                        ));
                  },
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
                                  image:
                                      NetworkImage(state.list[index].mainImage),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 1.h),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadiusDirectional.only(
                                      bottomStart: Radius.circular(7.r))),
                              child: Text(
                                  "%" "${((state.list[index].discount) * 100).toInt()}",
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
                              TextSpan(text: "${state.list[index].title}\n"),
                              TextSpan(
                                  text:
                                      "السعر / ${state.list[index].unit.name}\n",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).hintColor)),
                              TextSpan(
                                  text: "${state.list[index].price}" "ر.س",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context).primaryColor)),
                              TextSpan(
                                  text:
                                      "${state.list[index].priceBeforeDiscount}" "ر.س",
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
                                color: Theme.of(context).primaryColor)),
                        SizedBox(
                          height: 19.h,
                        ),
                        Center(
                          child: BlocConsumer(
                            bloc: addToCartBloc,
                            listener: (context, state) {
                              // if (state is AddToCartSuccessState) {
                              //   showMSG(message: state.msg);
                              // }
                              // if (state is AddToCartFailedState) {
                              //   showMSG(message: state.msg);
                              // }
                            },
                            builder: (context, state) {
                              return ElevatedButton(
                                onPressed: () {
                                  addToCartBloc.productId = id;
                                  addToCartBloc.add(AddToCartEvent());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff61B80C),
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
                                child: const Text("أضف للسلة"),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white10,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(11)),
                    ),
                  ),
                );
              }
            }));
      },
    );
  }
}
