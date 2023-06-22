import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/core/utils/helper_methods.dart';
import 'package:thamra/core/widgets/btn.dart';
import 'package:thamra/features/forget_pass/forget_pass_event.dart';

import '../../core/utils/app_routes.dart';
import '../../core/widgets/input.dart';
import '../../core/widgets/logo_image.dart';
import '../../core/widgets/text_for_login_or_signup.dart';
import '../../core/widgets/text_under_logo.dart';
import '../../features/forget_pass/forget_pass_cubit.dart';

class ForgetPassScreen extends StatefulWidget {
  ForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final bloc = KiwiContainer().resolve<ForgetPassCubit>();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        children: [
          const Logo(),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 27.w, bottom: 10.h),
            child: const MainTextStyle(text: 'نسيت كلمة المرور'),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 30.w, bottom: 28.h),
            child: Text(
              'أدخل رقم الجوال المرتبط بحسابك',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).hintColor),
            ),
          ),
          MainTextField(
              text: 'رقم الجوال ',
              prefixIcon: 'assets/icons/phone.png',
              controller: bloc.phoneController,
              type: InputType.phone),
          BlocConsumer(
            bloc: bloc,
            listener: (context, state) async {
              if (state is ForgetPassSuccessState) {
                showMSG(message: state.msg);
                await CacheHelper.savePhoneFromRegister(
                    phone: bloc.phoneController.text);
                GoRouter.of(context).push(AppRoutes.passCode);
              }
              if (state is ForgetPassFailedState) {
                showMSG(message: state.msg);
              }
            },
            builder: (context, state) {
              return MainButton(
                isLoading: state is ForgetPassLoadingState,
                text: 'تأكيد رقم الجوال',
                onPressed: () {
                  bloc.add(ForgetMyPassEvent());

                  // GoRouter.of(context).push(AppRoutes.passCode);
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 45.h, bottom: 32.h),
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
