import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/logic/cache_helper.dart';


import '../../core/design/logo_image.dart';
import '../../core/design/main_button.dart';
import '../../core/design/main_text_field.dart';
import '../../core/design/main_text_style.dart';
import '../../core/design/text_for_login_or_signup.dart';

import '../../core/logic/helper_methods.dart';
import '../../features/forget_pass/bloc.dart';
import 'confirm_pass_code.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final bloc = KiwiContainer().resolve<ForgetPassBloc>();

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
            child: const MainTextStyle(text: 'نسيت كلمة المرور',fontSize: 16),
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
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: MainTextField(
                text: 'رقم الجوال ',
                prefixIcon: 'assets/icons/png/phone.png',
                controller: bloc.phoneController,
                type: InputType.phone),
          ),
          BlocConsumer(
            bloc: bloc,
            listener: (context, state) async {
              if (state is ForgetPassSuccessState) {

                await CacheHelper.savePhoneFromRegister(
                    phone: bloc.phoneController.text).then((value) {
                  navigateTo(context,route:const ConfirmPassCodeScreen());

                });
              }

            },
            builder: (context, state) {
              return MainButton(
                isLoading: state is ForgetPassLoadingState,
                text: 'تأكيد رقم الجوال',
                onPressed: () {
                  bloc.add(ForgetMyPassEvent());

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
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    ));
  }
}
