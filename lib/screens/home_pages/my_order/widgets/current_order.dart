import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thamra/core/utils/app_routes.dart';

import '../../../../features/get_order/bloc.dart';
import '../../../../features/get_order/events.dart';
import '../../../../features/get_order/states.dart';

class CurrentOrderView extends StatefulWidget {
  const CurrentOrderView({Key? key}) : super(key: key);

  @override
  State<CurrentOrderView> createState() => _CurrentOrderViewState();
}

class _CurrentOrderViewState extends State<CurrentOrderView> {
  final bloc = KiwiContainer().resolve<GetOrdersBloc>()
    ..add(GetOrderEvent(endPoint: "current"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is GetOrderSuccessStates) {
          return ListView.builder(
            padding:
                EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 24),
            itemCount: state.list.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRoutes.orderInfo);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.016),
                        offset: Offset(0, 6),
                        blurStyle: BlurStyle.inner,
                        blurRadius: 17,
                      )
                    ]),
                margin: EdgeInsets.only(bottom: 16.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "طلب #${state.list[index].id}",
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                          textDirection: TextDirection.ltr,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          state.list[index].date,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).hintColor),
                        ),
                        SizedBox(
                          height: 14.5.h,
                        ),
                        Row(
                          children: [
                            ...List.generate(
                              state.list[index].products.length,
                              (i) => Container(
                                height: 25.w,
                                width: 25.w,
                                margin: EdgeInsets.symmetric(horizontal: 2.w),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "${state.list[index].products[i].url}"),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(11.r),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 25.w,
                              width: 25.w,
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              decoration: BoxDecoration(
                                color: Color(0xffEDF5E6),
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "+2",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 3.h),
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                            color: Color(0xffEDF5E6),
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              state.list[index].status,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 31.5.h,
                        ),
                        Text("${state.list[index].totalPrice}" + "ر.س",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Column(
            children: List.generate(
                4,
                (index) => Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white10,
                        child: Container(
                          height: 97.h,
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(11)),
                        ),
                      ),
                    )),
          );
        }
      },
    ));
  }
}
