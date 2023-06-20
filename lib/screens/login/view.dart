import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/utils/app_routes.dart';
import 'package:thamra/core/utils/helper_methods.dart';
import 'package:thamra/core/widgets/input.dart';
import 'package:thamra/core/widgets/text_for_login_or_signup.dart';
import 'package:thamra/features/login/login_bloc.dart';
import 'package:thamra/features/login/login_event.dart';
import '../../core/widgets/btn.dart';
import '../../core/widgets/logo_image.dart';
import '../../core/widgets/text_under_logo.dart';
import '../../features/login/login_state.dart';

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
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            const  Logo(),
              Padding(
                padding:
                     EdgeInsetsDirectional.only(start: 16.w, bottom: 10.h),
                child: MainTextStyle(text: 'مرحبا بك مرة أخرى'),
              ),
               Padding(
                padding: EdgeInsetsDirectional.only(start: 16.w, bottom: 28.h),
                child: Text(
                  'يمكنك تسجيل الدخول الأن',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff707070)),
                ),
              ),
              MainTextField(
                  controller: bloc.phoneController,
                  text: 'رقم الجوال ',
                  prefixIcon: 'assets/icons/phone.png',
                  type: InputType.phone),
              MainTextField(
                controller: bloc.passController,
                text: 'كلمة المرور',
                prefixIcon: 'assets/icons/pass.png',
                isObscure: true,
                type: InputType.pass,
              ),
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
                      child:  Text(
                        'نسيت كلمة المرور ؟',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff707070)),
                      ),
                    ),
                  ),
                ],
              ),
              BlocConsumer(
                  listener: (context, state) {
                    if (state is LoginSuccessStates) {
                      GoRouter.of(context).push(AppRoutes.home);

                      showMSG(
                          message: state.msg == ""
                              ? "تم تسجيل الدخول بنجاح"
                              : state.msg);
                    }
                    if (state is LoginFailedStates) {
                      showMSG(message: state.msg);
                    }
                  },
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is LoginLoadingStates) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return MainButton(
                        text: 'تسجيل الدخول',
                        onPressed: () {
                          bloc.add(LoginEvent());
                        },
                      );
                    }
                  }),
              Padding(
                padding:  EdgeInsets.only(top: 45.w),
                child: TextForLoginOrSignup(
                    text: 'ليس لديك حساب ؟',
                    signText: ' تسجيل الأن',
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.signUp);
                    }),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
