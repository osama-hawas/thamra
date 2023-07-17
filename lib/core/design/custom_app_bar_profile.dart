import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarProfile({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 50.w,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: Container(

        margin:  EdgeInsetsDirectional.only(start: 16.w, top: 8.h, bottom: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.r),
            color: Theme.of(context).primaryColor.withOpacity(.13)),
        child: InkWell(
          child: Padding(
            padding:  EdgeInsets.all(8.r),
            child: Image.asset('assets/icons/png/right.png'),
          ),
          onTap: () {GoRouter.of(context).pop();},

        ),
      ),
      title: Text(
        title,textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
