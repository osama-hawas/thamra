import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/constants/colors/color_genrate.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/core/kiwi.dart';
import 'package:thamra/core/utils/app_routes.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();
  initKiwi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => MaterialApp.router(
        builder: ((context, child) =>
            Directionality(textDirection: TextDirection.rtl, child: child!)),
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
    );
  }
}
