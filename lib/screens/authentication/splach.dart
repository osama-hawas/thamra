import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/core/logic/cache_helper.dart';
import 'package:thamra/screens/authentication/login.dart';
import 'package:thamra/screens/home_pages/view.dart';

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
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NavView(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
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
          duration: const Duration(seconds: 2),
          // delay:const Duration(milliseconds: 500),
          child: Spin(
            duration: const Duration(seconds: 1),
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
