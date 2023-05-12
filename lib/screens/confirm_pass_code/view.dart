import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thamra/core/utils/app_routes.dart';
import 'package:thamra/core/widgets/btn.dart';

import '../../core/widgets/logo_image.dart';
import '../../core/widgets/text_for_login_or_signup.dart';
import '../../core/widgets/text_under_logo.dart';

class ConfirmPassCodeScreen extends StatefulWidget {
  const ConfirmPassCodeScreen({Key? key}) : super(key: key);


  @override
  State<ConfirmPassCodeScreen> createState() => _ConfirmPassCodeScreenState();
}

class _ConfirmPassCodeScreenState extends State<ConfirmPassCodeScreen> {
  bool isTimeRunning = true;


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const Logo(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextUnderLogo(text: 'نسيت كلمة المرور',),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال',
                style: TextStyle(color: Color(0xff707070), fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    '+9660548745',
                    style: TextStyle(color: Color(0xff707070), fontSize: 16),
                    textDirection: TextDirection.ltr,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'تغيير رقم الجوال',
                    style: TextStyle(
                        color: Theme
                            .of(context)
                            .primaryColor,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PinCodeTextField(
                length: 4,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(15),
                  fieldHeight: 60,
                  fieldWidth: 70,
                  activeFillColor: Colors.transparent,
                  disabledColor: Colors.transparent,
                  inactiveColor: const Color(0xffF3F3F3),
                  selectedColor: Colors.grey,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                onCompleted: (v) {},
                appContext: context,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 37,
            ),
            Btn(
                text: 'تأكيد الكود',
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.confirmNewPass);
                }),
            const SizedBox(
              height: 27,
            ),
            const Text(
              'لم تستلم الكود ؟\n يمكنك إعادة إرسال الكود بعد',
              style: TextStyle(
                color: Color(0xff707070),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            if (isTimeRunning)
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: CircularCountDownTimer(
                  duration: 10,
                  initialDuration: 0,
                  width: 66,
                  height: 70,

                  ringColor: const Color(0xffD8D8D8),
                  fillColor: Theme
                      .of(context)
                      .primaryColor,
                  backgroundColor: Colors.transparent,
                  backgroundGradient: null,
                  strokeWidth: 2,
                  autoStart: true,
                  isReverse: true,
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(
                      fontSize: 21,
                      color: Theme
                          .of(context)
                          .primaryColor,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.MM_SS,
                  isReverseAnimation: false,
                  isTimerTextShown: true,
                  onComplete: () {
                    isTimeRunning = false;

                    setState(() {});
                  },
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Btn(
                text: 'إعادة الإرسال',
                onPressed: () {
                  isTimeRunning = true;

                  print('hello');
                  setState(() {

                  });
                },
                type: isTimeRunning ? BtnType.outLineDisable : BtnType.outLine,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45,bottom: 32),
              child: TextForLoginOrSignup(
                text: 'لديك حساب بالفعل ؟',
                signText: 'تسجيل الدخول',
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.login);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
