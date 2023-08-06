import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/screens/order_info.dart';
import '../../../features/get_order/bloc.dart';
import '../../shimmers/shimmer_listview.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  final bloc = KiwiContainer().resolve<GetOrdersBloc>()
    ..add(GetOrderEvent(endPoint: "current"));
  int? type = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "طلباتي",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            bottom: TabBar(
                onTap: (value) {
                  bloc.add(GetOrderEvent(
                      endPoint: value == 0 ? "current" : "finished"));
                  type = value;
                },
                tabs: [
                  Text(
                    "الحاليه",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "المنتهية",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  )
                ],
                labelColor: Colors.white,
                labelPadding: EdgeInsets.symmetric(vertical: 11.h),
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                unselectedLabelColor: Theme.of(context).hintColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r), // Creates border
                  color: Theme.of(context).primaryColor,
                ))),
        body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is GetOrderSuccessStates) {
              return ListView.builder(
                padding:
                    EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 24),
                itemCount: state.list.length,
                itemBuilder: (context, index) =>
                    _Item(orderData: state.list[index], type: type),
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

class _Item extends StatelessWidget {
  const _Item({Key? key, required this.orderData, required this.type})
      : super(key: key);
  final OrderData orderData;
  final int? type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  OrderInfoScreen(orderData: orderData, type: type),
            ));
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "طلب #${orderData.id}",
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
                    orderData.date,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).hintColor),
                  ),
                  SizedBox(
                    height: 14.5.h,
                  ),
                  FittedBox(
                    child: Row(
                      children: [
                        ...List.generate(
                          orderData.products.length > 3
                              ? 3
                              : orderData.products.length,
                          (i) => Container(
                            height: 25.w,
                            width: 25.w,
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(orderData.products[i].url),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(11.r),
                            ),
                          ),
                        ),
                        if (orderData.products.length > 3)
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
                                " ${(orderData.products.length - 3)}""+",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    decoration: BoxDecoration(
                      color: type == 0
                          ? Theme.of(context).primaryColor.withOpacity(.16)
                          : Theme.of(context).hintColor.withOpacity(.16),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        orderData.status,
                        style: TextStyle(
                            color: type == 0
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).hintColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 31.5.h,
                  ),
                  Text("${orderData.totalPrice}" "ر.س",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
