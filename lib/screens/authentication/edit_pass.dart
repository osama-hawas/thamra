import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/design/logo_image.dart';
import '../../core/design/main_button.dart';
import '../../core/design/main_text_field.dart';
import '../../core/design/main_text_style.dart';

class EditPassScreen extends StatelessWidget {
  const EditPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const Logo(),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 19.w, bottom: 10.h),
              child: const MainTextStyle(text: 'تغير كلمة المرور'),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 20.w, bottom: 22.h),
              child: Text(
                'قم بتغير كلمة المرور الخاصة بك',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff707070)),
              ),
            ),
            MainTextField(
                text: 'كلمة المرور القديمة',
                prefixIcon: 'assets/icons/png/pass.png',
                isObscure: true,
                // controller: bloc.passController,
                type: InputType.pass),
            MainTextField(
                text: 'كلمة المرور الجديدة',
                prefixIcon: 'assets/icons/png/pass.png',
                isObscure: true,
                // controller: bloc.confirmPassController,
                type: InputType.pass),
            MainButton(text: 'تغيير كلمة المرور', onPressed: () {}),

          ],
        ),
      ),
    );
  }
}
