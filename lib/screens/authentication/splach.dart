import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thamra/core/logic/cache_helper.dart';
import 'package:thamra/core/logic/app_routes.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {

      if (CacheHelper.getUserToken() != null) {
        GoRouter.of(context).pushReplacement(AppRoutes.home);
      } else {
        GoRouter.of(context).pushReplacement(AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/icons/png/background.png',
              ),
              fit: BoxFit.fill),
        ),
        child: ElasticInLeft(
          duration: const Duration(seconds: 3),
          // delay:const Duration(milliseconds: 500),
          child: Spin(
            duration: const Duration(seconds: 2),
            spins: 2,
            child: Center(
              child: Image.asset(
                'assets/icons/png/logo.png',
                height: 188.h,
                width: 173.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
