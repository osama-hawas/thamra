import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thamra/core/utils/app_routes.dart';

import '../../../../features/get_categories/model.dart';

class CategoriesItem extends StatelessWidget {
  final CategoryData categoryData;

  const CategoriesItem({Key? key, required this.categoryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

GoRouter.of(context).push(AppRoutes.catigories,extra: categoryData);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsetsDirectional.only(
          top: 18.h,
          start: 16.w,
        ),
        child: Column(
          children: [
            Container(
              height: 73.h,
              width: 73.w,
              padding: EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                  color: Color(0xffF6F9F3),
                  borderRadius: BorderRadius.circular(12.r)),
              child: Image.network(
                categoryData.media,
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              categoryData.name,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
