import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/logic/app_routes.dart';

import 'package:thamra/features/logout/bloc.dart';

import '../../core/logic/cache_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final logoutBloc = KiwiContainer().resolve<LogoutBloc>();
  Map<String, dynamic> profileItems = {
    "icon": [
      'assets/icons/png/user.png',
      'assets/icons/png/wallet.png',
      'assets/icons/png/location.png',
      'assets/icons/png/wallet.png',
      'assets/icons/png/question.png',
      'assets/icons/png/question.png',
      'assets/icons/png/check.png',
      'assets/icons/png/contact.png',
      'assets/icons/png/edit.png',
      'assets/icons/png/share.png',
      'assets/icons/png/about_app.png',
      'assets/icons/png/lang.png',
      'assets/icons/png/note.png',
      'assets/icons/png/star.png',
    ],
    "title": [
      'البيانات الشخصية',
      'المحفظة',
      'العناوين',
      'الدفع',
      'أسئلة متكررة',
      ' VIP حساب ',
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
      AppRoutes.vip,
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
                      image: AssetImage('assets/icons/png/background_shadow.png'),
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
                              color: const Color(0xffA2D273)),
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
                                'assets/icons/png/left.png',
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

                    GoRouter.of(context).pushReplacement(AppRoutes.login);
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
                            'assets/icons/png/turn_off.png',
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
