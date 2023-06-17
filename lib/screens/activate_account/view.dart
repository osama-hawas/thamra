import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/core/utils/helper_methods.dart';
import 'package:thamra/core/widgets/text_under_logo.dart';
import 'package:thamra/features/active_acount/active_acount_cubit.dart';

import '../../core/utils/app_routes.dart';
import '../../core/widgets/btn.dart';
import '../../core/widgets/logo_image.dart';
import '../../core/widgets/text_for_login_or_signup.dart';
import '../../features/active_acount/events.dart';
import '../../features/resend_code/_cubit.dart';
import '../../features/resend_code/_state.dart';
import '../../features/resend_code/events.dart';

class ActivateAccountScreen extends StatefulWidget {
  const ActivateAccountScreen({Key? key}) : super(key: key);

  @override
  State<ActivateAccountScreen> createState() => _ActivateAccountScreenState();
}

class _ActivateAccountScreenState extends State<ActivateAccountScreen> {
  final bloc = KiwiContainer().resolve<ActiveAcountCubit>();
  final reSendCodeBloc = KiwiContainer().resolve<ResendCodeCubit>();
  bool isTimeRunning = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Logo(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextUnderLogo(text: 'تفعيل الحساب'),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال',
                style: TextStyle(color: Color(0xff707070), fontSize: 16.sp),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    CacheHelper.showPhoneFromRegister()!,
                    style: TextStyle(color: Color(0xff707070), fontSize: 16.sp),
                    textDirection: TextDirection.ltr,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: Text(
                      'تغيير رقم الجوال',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.sp,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: PinCodeTextField(
                length: 4,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(15.r),
                  fieldHeight: 65.h,
                  fieldWidth: 65.w,
                  activeFillColor: Colors.transparent,
                  disabledColor: Colors.transparent,
                  inactiveColor: const Color(0xffF3F3F3),
                  selectedColor: Colors.grey,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                onCompleted: (value) {
                  bloc.code = value;
                },
                appContext: context,
                onChanged: (v) {},
              ),
            ),
            SizedBox(
              height: 37.h,
            ),
            BlocConsumer<ActiveAcountCubit, ActiveAcountState>(
              listener: (context, state) {
                if (state is ActiveAcountSuccessState) {
                  showToast(message: "تم تفعيل حسابك بنجاح", context: context);
                  GoRouter.of(context).push(AppRoutes.login);
                }
                if (state is ActiveAcountFailedState) {
                  showToast(message: "الكود غير صحيح", context: context);
                }
              },
              builder: (context, state) {
                return Btn(
                    isLoading: state is ActiveAcountLoadingState,
                    text: 'تأكيد الكود',
                    onPressed: () {
                      if (bloc.code != null) {
                        bloc.add(ActiveAcountEvent());
                      }
                    });
              },
            ),
            SizedBox(
              height: 27.h,
            ),
            Text(
              'لم تستلم الكود ؟\n يمكنك إعادة إرسال الكود بعد',
              style: TextStyle(
                color: Color(0xff707070),
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),
            if (isTimeRunning)
              Padding(
                padding: EdgeInsets.only(top: 22.h),
                child: CircularCountDownTimer(
                  duration: 30,
                  initialDuration: 0,
                  width: 66.w,
                  height: 70.h,
                  ringColor: const Color(0xffD8D8D8),
                  fillColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.transparent,
                  backgroundGradient: null,
                  strokeWidth: 2,
                  autoStart: true,
                  isReverse: true,
                  controller: CountDownController(),
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(
                      fontSize: 21.sp,
                      color: Theme.of(context).primaryColor,
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
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: BlocConsumer(
                bloc: reSendCodeBloc,
                listener: (context, state) {
                  if (state is ResendCodeSuccessState) {
                    showToast(message: state.msg, context: context);
                  }
                },
                builder: (context, state) {
                  return Btn(
                    isLoading: state is ResendCodeLoadingState,
                    text: 'إعادة الإرسال',
                    onPressed: () {
                      reSendCodeBloc.add(ResendCodeEvent());
                      isTimeRunning = true;
                      setState(() {});
                    },
                    type: isTimeRunning
                        ? BtnType.outLineDisable
                        : BtnType.outLine,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 45.h, bottom: 32.h),
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
