import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thamra/core/utils/app_routes.dart';
import 'package:thamra/core/widgets/btn.dart';

import '../../core/widgets/input.dart';
import '../../core/widgets/logo_image.dart';
import '../../core/widgets/text_for_login_or_signup.dart';
import '../../core/widgets/text_under_logo.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        children: [
          Logo(),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 27, bottom: 10),
            child: TextUnderLogo(text: 'نسيت كلمة المرور'),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(start: 30, bottom: 28),
            child: Text(
              'أدخل رقم الجوال المرتبط بحسابك',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff707070)),
            ),
          ),
          Input(
              text: 'رقم الجوال ',

              prefixIcon: 'assets/icons/phone.png',
              type: InputType.phone
          ),
          Btn(
            text: 'تأكيد رقم الجوال',
            onPressed: (){
              GoRouter.of(context).push(AppRoutes.passCode);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45,bottom: 32),
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
