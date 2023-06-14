import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/screens/home_pages/home/widgets/categoru_item.dart';
import 'package:thamra/screens/home_pages/home/widgets/custom_app_bar.dart';
import 'package:thamra/screens/home_pages/home/widgets/product_item.dart';

import '../../../core/widgets/input.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          Input(
            text: 'ابحث عن ماتريد؟',
            prefixIcon: 'assets/icons/search.png',
            onChanged: (value) {},
            homeInput: true,
          ),
          Container(
            height: 164.h,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/testimg.png'),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 28.h, bottom: 8.h),
            child: Container(
              // color: Colors.amber,
              // height: 140,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 16.w),
                        child: Text(
                          'الأقسام',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 20.w),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'عرض الكل',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 135.h,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CategoriItem(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: Text(
              'الأصناف',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
            ),
          ),
          ProductItem(),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    ));
  }
}
