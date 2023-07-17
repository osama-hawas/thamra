import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../../features/product_rate/bloc.dart';


class CustomProductRate extends StatefulWidget {
  const CustomProductRate({Key? key}) : super(key: key);

  @override
  State<CustomProductRate> createState() => _CustomProductRateState();
}

class _CustomProductRateState extends State<CustomProductRate> {
  final bloc = KiwiContainer().resolve<GetProductRateBloc>()
    ..add(GetProductRateEvent());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 14.h),
      scrollDirection: Axis.horizontal,
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetProductRateSuccessStates) {
            return Row(
                children: List.generate(
              state.list.length,
              (index) => Container(
                width: 267.w,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 14,
                          color: Colors.grey.withOpacity(.16),
                          blurStyle: BlurStyle.outer)
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  state.list[index].clientName,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              SizedBox(
                                height: 10.h,
                                width: 60.w,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: RatingBar.builder(
                                    initialRating: state.list[index].value.toDouble(),
                                    minRating: 1,
                                    itemSize: 15.r,
                                    ignoreGestures: true,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star_rate_rounded,
                                      color: Color(0xffFF9529),
                                      size: 5,
                                    ),
                                    onRatingUpdate: (rating) {

                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            state.list[index].comment,
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      height: 55.w,
                      width: 55.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Image.network(
                        state.list[index].clientImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ));
          } else {
            return const Text("data");
          }
        },
      ),
    );
  }
}
