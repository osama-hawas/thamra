import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/core/logic/color_genrate.dart';
import 'package:thamra/core/logic/cache_helper.dart';
import 'package:thamra/features/kiwi.dart';
import 'package:thamra/core/logic/app_routes.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.instance.getToken().then((value) {
    print(value);
  });




  await CacheHelper.init();
  initKiwi();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),

        startLocale: const Locale('ar'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
     const SystemUiOverlayStyle(
          statusBarColor: Color(0xff4C8613),
          statusBarIconBrightness: Brightness.light),
    );



    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // builder: ((context, child) =>
          //     Directionality(textDirection: mat.TextDirection.rtl, child: child!)),
          theme: ThemeData(
            fontFamily: 'Tajawal',
            // useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: ColorsGenerate.from(const Color(0xff4C8613)),
            hintColor: const Color(0xffA7A7A7),
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.router,
        ),
      ),
    );
  }
}
