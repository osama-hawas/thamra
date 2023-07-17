import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../features/notifications/bloc.dart';


class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.notification})
      : super(key: key);
  final NotificationsData notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      margin: EdgeInsetsDirectional.only(
          start: 16.w, end: 16.w, bottom: 16.h, top: 32.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),


            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(.13),
                borderRadius: BorderRadius.circular(9.r)),
            child: Image.network(
              notification.image,
              fit: BoxFit.scaleDown,
              height: 20.w,
              width: 20.w,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  notification.body,
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  notification.createdAt,
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
