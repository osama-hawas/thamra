import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/design/custom_app_bar_profile.dart';
import 'package:thamra/core/design/main_button.dart';
import 'package:thamra/core/design/main_text_field.dart';
import 'package:thamra/core/logic/helper_methods.dart';
import 'package:thamra/features/add_product_rate/bloc.dart';
import 'package:thamra/screens/shimmers/shimmer_listview.dart';

import '../features/get_product/bloc.dart';

class ProductRateScreen extends StatefulWidget {
  const ProductRateScreen({Key? key}) : super(key: key);

  @override
  State<ProductRateScreen> createState() => _ProductRateScreenState();
}

class _ProductRateScreenState extends State<ProductRateScreen> {
  final productBloc = KiwiContainer().resolve<GetProductsBloc>()
    ..add(GetProductEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarProfile(title: "تقييم المنتجات"),
      body: SingleChildScrollView(
        child: BlocBuilder(
          bloc: productBloc,
          builder: (context, state) {
            if (state is GetProductsSuccessState) {
              return Column(
                children: List.generate(
                  state.list.length,
                  (index) => _Item(
                    productData: state.list[index],
                  ),
                ),
              );
            } else {
              return const ShimmerListView();
            }
          },
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  const _Item({Key? key, required this.productData}) : super(key: key);
  final ProductData productData;

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  final rateProductBloc = KiwiContainer().resolve<AddProductRateBloc>();

  var rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.r),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 14,
              color: Colors.grey.withOpacity(.16),
              blurStyle: BlurStyle.outer)
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70.h,
                width: 69.w,
                alignment: Alignment.topCenter,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.productData.mainImage),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              SizedBox(
                width: 11.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productData.title.toString(),
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      "السعر / 1كجم",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "${widget.productData.priceBeforeDiscount}ر.س",
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
                    RatingBar.builder(
                      minRating: 1,
                      itemSize: 25.r,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star_rate_rounded,
                        color: Color(0xffFF9529),
                        size: 5,
                      ),
                      onRatingUpdate: (rating) {
                        rate = rating;
                        rateProductBloc.value = rating.toInt();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          MainTextField(
            text: "رأيك عن المنتج",
            minLines: 5,
            controller: rateProductBloc.commitController,
          ),
          BlocBuilder(
            bloc: rateProductBloc,
            builder: (context, rateState) {
              return MainButton(
                  text: "تقيم",
                  onPressed: () {
                    rateProductBloc.productId = widget.productData.id;

                    if (rate != null) {
                      rateProductBloc.add(AddProductRateEvent());
                      rateProductBloc.commitController.clear();
                    } else {
                      showMSG(
                        message: "برجاء تقييم المنتج أولا",
                      );
                    }
                  });
            },
          ),
        ],
      ),
    );
  }
}
