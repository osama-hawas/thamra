import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/design/main_text_style.dart';
import '../../core/logic/helper_methods.dart';
import '../../features/notifications/bloc.dart';
import '../shimmers/shimmer_listview.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final bloc = KiwiContainer().resolve<GetNotificationsBloc>()
    ..add(GetNotificationsEvents());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const MainTextStyle(text: "الإشعارات",fontSize: 20),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetNotificationsSuccessStates) {
            return ListView.builder(
              itemBuilder: (context, index) => _Item(model: state.list[index]),
              itemCount: state.list.length,
            );
          } else {
            return const ShimmerListView();
          }
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({Key? key, required this.model}) : super(key: key);
  final NotificationsData model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {

      },
      child: Container(
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
                model.image,
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
                    model.title,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    model.body,
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    model.createdAt,
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
