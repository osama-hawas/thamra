import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/screens/home_pages/my_order/widgets/current_order.dart';
import 'package:thamra/screens/home_pages/my_order/widgets/finished_order.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

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
                  color: Theme.of(context).primaryColor),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            bottom: TabBar(
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
                unselectedLabelColor: Theme.of(context).hintColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r), // Creates border
                  color: Theme.of(context).primaryColor,
                ))),
        body: TabBarView(children: [
          CurrentOrderView(),
          FinishedOrderView(),
        ]),
      ),
    );
  }
}
