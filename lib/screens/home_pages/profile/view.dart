import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/utils/app_routes.dart';
import 'package:thamra/core/utils/helper_methods.dart';
import 'package:thamra/features/logout/bloc.dart';
import 'package:thamra/features/logout/events.dart';
import 'package:thamra/features/logout/states.dart';

import '../../../core/data/local/cache_helper.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final logoutBloc = KiwiContainer().resolve<LogoutBloc>();
  Map<String, dynamic> profileItems = {
    "icon": [
      'assets/icons/profile_icon/COCO-Duotone-User.png',
      'assets/icons/profile_icon/COCO-Line-Wallet.png',
      'assets/icons/profile_icon/COCO-Duotone-Location.png',
      'assets/icons/profile_icon/wallet.png',
      'assets/icons/profile_icon/COCO-Duotone-Question.png',
      'assets/icons/profile_icon/COCO-Duotone-Shield - check.png',
      'assets/icons/profile_icon/contact.png',
      'assets/icons/profile_icon/COCO-Duotone-Edit -.png',
      'assets/icons/profile_icon/share.png',
      'assets/icons/profile_icon/about_app.png',
      'assets/icons/profile_icon/lang.png',
      'assets/icons/profile_icon/COCO-Duotone-Note.png',
      'assets/icons/profile_icon/COCO-Line-Star.png',
    ],
    "title": [
      'البيانات الشخصية',
      'المحفظة',
      'العناوين',
      'الدفع',
      'أسئلة متكررة',
      'سياسة الخصوصية',
      'تواصل معنا',
      'الشكاوي والأقتراحات',
      'مشاركة التطبيق',
      'عن التطبيق',
      'تغيير اللغة',
      'الشروط والأحكام',
      'تقييم التطبيق',
    ],
    "route": [
      AppRoutes.profileinfo,
      AppRoutes.wallet,
      AppRoutes.adresses,
      AppRoutes.paiements,
      AppRoutes.faqs,
      AppRoutes.privacyscreen,
      AppRoutes.contentwithus,
      AppRoutes.suggestionPage,
      AppRoutes.shareapp,
      AppRoutes.aboutApp,
      AppRoutes.changelang,
      AppRoutes.strokeandtightness,
      AppRoutes.rateapp,
    ],
  };

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          statusBarIconBrightness: Brightness.light),
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 217.h,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.r),
                      bottomRight: Radius.circular(40.r)),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/Mask Group png.png'),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 32.h),
                      child: Text('حسابي',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 20.h),
                        height: 72.h,
                        width: 76.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          image: DecorationImage(
                              image: NetworkImage(
                                CacheHelper.getImage(),
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text(CacheHelper.getName(),
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
                      child: Text(CacheHelper.getPhone(),
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffA2D273)),
                          textDirection: TextDirection.ltr),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  profileItems["icon"].length,
                  (index) => GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(profileItems['route'][index]);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      // margin: const EdgeInsets.only(top: 15),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 7.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                profileItems['icon'][index],
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              Text(
                                profileItems['title'][index],
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).primaryColor),
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/icons/profile_icon/COCO-Line-Arrow - Left.png',
                                fit: BoxFit.fill,
                                color: const Color(0xffB2BCA8),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BlocConsumer(
                bloc: logoutBloc,
                listener: (context, state) {
                  if (state is LogoutSuccessState) {
                    showMSG(message: state.msg);
                    GoRouter.of(context).pushReplacement(AppRoutes.login);
                  }
                  if (state is LogoutFailedState) {
                    showMSG(message: state.msg);
                  }
                },
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      logoutBloc.add(LogoutEvent());

                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      padding: EdgeInsets.symmetric(vertical: 36.h),
                      child: Row(
                        children: [
                          Text(
                            'تسجيل الخروج',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/icons/profile_icon/COCO-Duotone-Turn off.png',
                            fit: BoxFit.fill,
                            color: const Color(0xffB2BCA8),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
