import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../core/design/custom_app_bar_profile.dart';
import '../../features/about_app/bloc.dart';


class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  final bloc = KiwiContainer().resolve<AboutAppBloc>()..add(GetAboutAppDataEvent());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar:const CustomAppBarProfile(title: 'عن التطبيق'),
          body: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if (state is AboutApploadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AboutAppsuccessState) {
                return ListView(
                  children: [
                    Image.asset(
                      'assets/icons/png/logo.png',
                      height: 160.h,
                      width: 160.w,
                    ),
                    Padding(
                      padding:  EdgeInsets.all(13.r),
                      child: Html(
                        data: bloc.data,
                      ),
                    )
                  ],
                );
              } else {
                return  Text(
                  'Failed',
                  style: TextStyle(fontSize: 50.sp),
                );
              }
            },
          )),
    );
  }
}
