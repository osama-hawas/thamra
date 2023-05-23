import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:thamra/core/utils/app_routes.dart';

import '../../../core/data/local/cache_helper.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

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
                height: 217,
                width: double.infinity,
                margin:const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius:const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  image:const DecorationImage(
                      image: AssetImage('assets/images/Mask Group png.png'),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding:  EdgeInsets.only(top: 32),
                      child: Text('حسابي',
                          style:  TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 72,
                        width: 76,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                CacheHelper.getImage(),),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                      Padding(
                      padding:const  EdgeInsets.only(top: 4),
                      child: Text(CacheHelper.getName(),
                          style:const  TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                      Padding(
                      padding:const  EdgeInsets.only(top: 4, bottom: 4),
                      child: Text(CacheHelper.getPhone(),
                          style:const  TextStyle(
                              fontSize: 14,
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

                      padding: const EdgeInsets.symmetric(
                          horizontal: 16,),
                      // margin: const EdgeInsets.only(top: 15),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                profileItems['icon'][index],
                                fit: BoxFit.fill,
                              ),
                              const   SizedBox(
                                width: 9,
                              ),
                              Text(
                                profileItems['title'][index],
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).primaryColor),
                              ),
                              const   Spacer(),
                              Image.asset(
                                'assets/icons/profile_icon/COCO-Line-Arrow - Left.png',
                                fit: BoxFit.fill,
                                color:const Color(0xffB2BCA8),
                              ),
                            ],
                          ),const SizedBox(height: 7,),
                         const Divider(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin:const EdgeInsets.symmetric(horizontal: 16),
                padding:const EdgeInsets.symmetric(vertical: 36),
                child: Row(
                  children: [
                    Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/icons/profile_icon/COCO-Duotone-Turn off.png',
                      fit: BoxFit.fill,
                      color:const Color(0xffB2BCA8),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
