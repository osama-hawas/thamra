import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thamra/core/utils/app_routes.dart';
import 'package:thamra/core/widgets/input.dart';
import 'package:thamra/core/widgets/text_for_login_or_signup.dart';
import '../../core/widgets/btn.dart';
import '../../core/widgets/logo_image.dart';
import '../../core/widgets/text_under_logo.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(


            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Logo(),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 16, bottom: 10),
                    child: TextUnderLogo(text: 'مرحبا بك مرة أخرى'),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 16, bottom: 28),
                    child: Text(
                      'يمكنك تسجيل الدخول الأن',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff707070)),
                    ),
                  ),
                  Input(
                      text: 'رقم الجوال ',

                      prefixIcon: 'assets/icons/phone.png',
                  type: InputType.phone),
                  Input(
                    text: 'كلمة المرور',
                    prefixIcon: 'assets/icons/pass.png',
                    isObscure: true,

                    type: InputType.pass,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            end: 16, bottom: 22),
                        child: InkWell(
                          onTap: () {
                            GoRouter.of(context).push(AppRoutes.forgetPass);
                          },
                          child: const Text(
                            'نسيت كلمة المرور ؟',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff707070)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Btn(
                    text: 'تسجيل الدخول',
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.home);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45),
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
