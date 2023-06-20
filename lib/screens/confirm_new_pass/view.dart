import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/utils/app_routes.dart';
import 'package:thamra/core/utils/helper_methods.dart';
import 'package:thamra/core/widgets/btn.dart';
import 'package:thamra/core/widgets/input.dart';
import 'package:thamra/core/widgets/logo_image.dart';
import 'package:thamra/core/widgets/text_for_login_or_signup.dart';
import 'package:thamra/core/widgets/text_under_logo.dart';

import '../../features/confirm_new_pass/confirm_new_pass_cubit.dart';
import '../../features/confirm_new_pass/confirm_new_pass_state.dart';
import '../../features/confirm_new_pass/events.dart';

class ConfirmNewPassScreen extends StatefulWidget {
  ConfirmNewPassScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmNewPassScreen> createState() => _ConfirmNewPassScreenState();
}

class _ConfirmNewPassScreenState extends State<ConfirmNewPassScreen> {
  final bloc = KiwiContainer().resolve<ConfirmNewPassCubit>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const Logo(),
             Padding(
              padding: EdgeInsetsDirectional.only(start: 19.w, bottom: 10.h),
              child: MainTextStyle(text: 'نسيت كلمة المرور'),
            ),
             Padding(
              padding: EdgeInsetsDirectional.only(start: 20.w, bottom: 22.h),
              child: Text(
                'أدخل كلمة المرور الجديدة',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff707070)),
              ),
            ),
            MainTextField(
                text: 'كلمة المرور الجديدة',
                prefixIcon: 'assets/icons/pass.png',
                isObscure: true,
                controller: bloc.passController,
                type: InputType.pass),
            MainTextField(
                text: 'تأكيد كلمة المرور الجديدة',
                prefixIcon: 'assets/icons/pass.png',
                isObscure: true,
                controller: bloc.confirmPassController,
                type: InputType.pass),
            BlocConsumer(
              bloc: bloc,
              listener: (context, state) {
                if (state is ConfirmNewPassSuccessState) {
                  showMSG(message: state.msg);
                  GoRouter.of(context).pushReplacement(AppRoutes.login);
                }
                if (state is ConfirmNewPassFailedState) {
                  showMSG(message: state.msg);
                }
              },
              builder: (context, state) {
                return MainButton(
                    text: 'تغيير كلمة المرور',
                    isLoading: state is ConfirmNewPassLoadingState,
                    onPressed: () {
                      if (bloc.passController.text ==
                          bloc.confirmPassController.text) {
                        bloc.add(ConfirmNewPassEvent());
                      }
                      if (bloc.passController.text !=
                          bloc.confirmPassController.text) {
                        bloc.passController.clear();
                        bloc.confirmPassController.clear();
                        showMSG(message: "كلمة المرور غير متطابقة");
                      }
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
