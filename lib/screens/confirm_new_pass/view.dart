import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class ConfirmNewPassScreen extends StatefulWidget {
  ConfirmNewPassScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmNewPassScreen> createState() => _ConfirmNewPassScreenState();
}

class _ConfirmNewPassScreenState extends State<ConfirmNewPassScreen> {
  final cubit = KiwiContainer().resolve<ConfirmNewPassCubit>();
  final passController = TextEditingController();

  final confirmPassController = TextEditingController();

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
                controller: passController,
                type: InputType.pass),
            Input(
                text: 'تأكيد كلمة المرور الجديدة',
                prefixIcon: 'assets/icons/pass.png',
                isObscure: true,
                controller: confirmPassController,
                type: InputType.pass),
            BlocConsumer<ConfirmNewPassCubit, ConfirmNewPassState>(
              listener: (context, state) {
                if (state is ConfirmNewPassSuccessState) {
                  showToast(
                      message: "تم تغير كلمة المرور بنجاح",
                      context: context);
                  GoRouter.of(context).pushReplacement(AppRoutes.login);
                }

              },
              builder: (context, state) {
                return Btn(
                    text: 'تغيير كلمة المرور',
                    isLoading: state is ConfirmNewPassLoadingState,
                    onPressed: () {
                      if (passController.text ==
                          confirmPassController.text) {
                        cubit.confirmNewPass(pass: passController.text);
                      }   if (passController.text != confirmPassController.text) {
                        passController.clear();
                        confirmPassController.clear();
                        showToast(
                            message: "كلمة المرور غير متطابقة", context: context);
                      }
                    });
              },
            ),
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
