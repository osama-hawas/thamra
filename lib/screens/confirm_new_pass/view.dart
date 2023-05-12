import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thamra/core/utils/app_routes.dart';
import 'package:thamra/core/widgets/btn.dart';
import 'package:thamra/core/widgets/input.dart';
import 'package:thamra/core/widgets/logo_image.dart';
import 'package:thamra/core/widgets/text_for_login_or_signup.dart';
import 'package:thamra/core/widgets/text_under_logo.dart';

class ConfirmNewPassScreen extends StatelessWidget {
  const ConfirmNewPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const Logo(),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 19, bottom: 10),
              child: TextUnderLogo(text: 'نسيت كلمة المرور'),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 20, bottom: 22),
              child: Text(
                'أدخل كلمة المرور الجديدة',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff707070)),
              ),
            ),
            Input(
                text: 'كلمة المرور الجديدة',
                prefixIcon: 'assets/icons/pass.png',
                isObscure: true,
                type: InputType.pass),
            Input(
                text: 'تأكيد كلمة المرور الجديدة',
                prefixIcon: 'assets/icons/pass.png',
                isObscure: true,
                type: InputType.pass),
            Btn(
                text: 'تغيير كلمة المرور',
                onPressed: () {
                  GoRouter.of(context)
                      .pushReplacement(AppRoutes.activateAccount);
                }),
            Padding(
              padding: EdgeInsets.only(top: 45),
              child: TextForLoginOrSignup(
                text: 'لديك حساب بالفعل',
                signText: 'تسجيل الدخول',
                onTap: () {
                  GoRouter.of(context).pushReplacement(AppRoutes.login);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
