import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/logic/app_routes.dart';

import 'package:thamra/features/login/bloc.dart';

import '../../core/design/logo_image.dart';
import '../../core/design/main_button.dart';
import '../../core/design/main_text_field.dart';
import '../../core/design/main_text_style.dart';
import '../../core/design/text_for_login_or_signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bloc = KiwiContainer().resolve<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Logo(),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 16.w, bottom: 10.h),
                child: const MainTextStyle(text: 'مرحبا بك مرة أخرى'),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 16.w, bottom: 28.h),
                child: Text(
                  'يمكنك تسجيل الدخول الأن',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).hintColor),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      MainTextField(
                          controller: bloc.phoneController,
                          text: 'رقم الجوال ',
                          prefixIcon: 'assets/icons/png/phone.png',
                          type: InputType.phone),
                      MainTextField(
                        controller: bloc.passController,
                        text: 'كلمة المرور',
                        prefixIcon: 'assets/icons/png/pass.png',
                        isObscure: true,
                        type: InputType.pass,
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(end: 16.w, bottom: 22.h),
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRoutes.forgetPass);
                      },
                      child: Text(
                        'نسيت كلمة المرور ؟',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff707070)),
                      ),
                    ),
                  ),
                ],
              ),
              BlocConsumer(
                  listener: (context, state) {
                    if (state is LoginSuccessStates) {
                      GoRouter.of(context).pushReplacement(AppRoutes.home);
                    }
                  },
                  bloc: bloc,
                  builder: (context, state) {
                    return MainButton(
                      text: 'تسجيل الدخول',
                      isLoading: state is LoginLoadingStates,
                      onPressed: () {
                        bloc.add(LoginEvents());
                      },
                    );
                  }),
              Padding(
                padding: EdgeInsets.only(top: 45.w),
                child: TextForLoginOrSignup(
                    text: 'ليس لديك حساب ؟',
                    signText: ' تسجيل الأن',
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.signUp);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
