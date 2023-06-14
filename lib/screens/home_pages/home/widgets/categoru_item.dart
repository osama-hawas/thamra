import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriItem extends StatelessWidget {
  const CategoriItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
              padding: EdgeInsets.all(18.r),
              decoration: BoxDecoration(
                  color: Color(0xffF6F9F3),
                  borderRadius: BorderRadius.circular(12.r)),
              child: Image.asset(
                'assets/images/t1.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'الخضار',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
