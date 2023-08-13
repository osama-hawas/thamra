import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/logic/app_routes.dart';

import '../../core/design/logo_image.dart';
import '../../core/design/main_button.dart';
import '../../core/design/main_text_field.dart';
import '../../core/design/main_text_style.dart';
import '../../core/design/text_for_login_or_signup.dart';
import '../../features/confirm_new_pass/bloc.dart';

class ConfirmNewPassScreen extends StatefulWidget {
  const ConfirmNewPassScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmNewPassScreen> createState() => _ConfirmNewPassScreenState();
}

class _ConfirmNewPassScreenState extends State<ConfirmNewPassScreen> {
  final bloc = KiwiContainer().resolve<ConfirmNewPassBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const Logo(),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 19.w, bottom: 10.h),
              child: const MainTextStyle(text: 'نسيت كلمة المرور'),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 20.w, bottom: 22.h),
              child: Text(
                'أدخل كلمة المرور الجديدة',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff707070)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(children: [  MainTextField(
                  text: 'كلمة المرور الجديدة',
                  prefixIcon: 'assets/icons/png/pass.png',
                  isObscure: true,
                  controller: bloc.passController,
                  type: InputType.pass),
                MainTextField(
                    text: 'تأكيد كلمة المرور الجديدة',
                    prefixIcon: 'assets/icons/png/pass.png',
                    isObscure: true,
                    controller: bloc.confirmPassController,
                    type: InputType.pass),],),
            ),
            BlocConsumer(
              bloc: bloc,
              listener: (context, state) {
                if (state is ConfirmNewPassSuccessState) {
                  GoRouter.of(context).pushReplacement(AppRoutes.login);
                }
              },
              builder: (context, state) {
                return MainButton(
                    text: 'تغيير كلمة المرور',
                    isLoading: state is ConfirmNewPassLoadingState,
                    onPressed: () {
                      bloc.add(ConfirmNewPassEvent());
                    });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 45.h),
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
