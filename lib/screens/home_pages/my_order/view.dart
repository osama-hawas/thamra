import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/logic/app_routes.dart';
import '../../../features/get_order/bloc.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  final bloc = KiwiContainer().resolve<GetOrdersBloc>();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "طلباتي",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900,
                  color: Theme
                      .of(context)
                      .primaryColor),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            bottom: TabBar(
                onTap: (value) {
                  bloc.add(GetOrderEvent(endPoint: value == 0 ? "current":"finished"));
                },
                tabs: [
                  Text(
                    "الحاليه",
                    style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  Text("المنتهية",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold))
                ],
                labelColor: Colors.white,
                labelPadding: EdgeInsets.symmetric(vertical: 11.h),
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                unselectedLabelColor: Theme
                    .of(context)
                    .hintColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r), // Creates border
                  color: Theme
                      .of(context)
                      .primaryColor,
                ))),
        body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is GetOrderSuccessStates) {
              return ListView.builder(
                padding:
                EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 24),
                itemCount: state.list.length,
                itemBuilder: (context, index) => _Item(),
              );
            } else {
              return Column(
                children: List.generate(
                    4,
                        (index) =>
                        Padding(
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
        ),
      ),
    );
  }
}


class _Item extends StatelessWidget {
  const _Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                offset: const Offset(0, 6),
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
                  "طلب #",
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme
                          .of(context)
                          .primaryColor),
                  textDirection: TextDirection.ltr,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "state.list[index].date",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme
                          .of(context)
                          .hintColor),
                ),
                SizedBox(
                  height: 14.5.h,
                ),
                Row(
                  children: [
                    ...List.generate(
                     5,
                          (i) =>
                          Container(
                            height: 25.w,
                            width: 25.w,
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "state.list[index].products[i].url)"),
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
                        color: const Color(0xffEDF5E6),
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "+2",
                          style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
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
                    color: const Color(0xffEDF5E6),
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "state.list[index].status",
                      style: TextStyle(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 31.5.h,
                ),
                Text("" "ر.س",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Theme
                            .of(context)
                            .primaryColor)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
