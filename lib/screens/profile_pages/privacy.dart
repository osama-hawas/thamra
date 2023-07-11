import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/features/privacy/bloc.dart';


import '../../core/design/custom_app_bar_profile.dart';


class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  final bloc = KiwiContainer().resolve<PrivacyBloc>()..add(GetPrivacyEvent());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBarProfile(title: 'سياسة الخصوصية')),
          body: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if (state is PrivacyloadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PrivacysuccessState) {
                return ListView(
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(13.r),
                      child: Html(data: bloc.data),
                    )
                  ],
                );
              } else {
                return Text(
                  'Failed',
                  style: TextStyle(fontSize: 50.sp),
                );
              }
            },
          )),
    );
  }
}
