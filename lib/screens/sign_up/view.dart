import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thamra/core/utils/app_routes.dart';
import 'package:thamra/core/widgets/btn.dart';
import 'package:thamra/core/widgets/input.dart';
import 'package:thamra/core/widgets/logo_image.dart';
import 'package:thamra/core/widgets/text_for_login_or_signup.dart';
import 'package:thamra/core/widgets/text_under_logo.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        children: [
          const Logo(),
          const Padding(
            padding: EdgeInsetsDirectional.only(start: 16, bottom: 10),
            child: TextUnderLogo(text: 'مرحبا بك مرة أخرى'),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(start: 16, bottom: 22),
            child: Text(
              'يمكنك تسجيل حساب جديد الأن',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff707070)),
            ),
          ),
          Input(
            text: 'اسم المستخدم',
            prefixIcon: 'assets/icons/man.png',
            type: InputType.normal,
          ),
          Input(
            text: 'رقم الجوال',
            prefixIcon: 'assets/icons/phone.png',

            type: InputType.phone,
          ),
          Input(
              text: 'كلمة المرور',
              prefixIcon: 'assets/icons/pass.png',
              isObscure: true,

          type: InputType.pass,),
          Input(
              text: 'كلمة المرور',
              prefixIcon: 'assets/icons/pass.png',
              isObscure: true,

              type: InputType.pass),
          Btn(
              text: 'تسجيل',
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.home);
              }),
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: TextForLoginOrSignup(
              text: 'لديك حساب بالفعل ؟',
              signText: 'تسجيل الدخول',
              onTap: () {
                GoRouter.of(context).pop();
              },
            ),
          )
        ],
      ),
    ));
  }
}
