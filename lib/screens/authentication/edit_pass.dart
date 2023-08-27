import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../core/design/logo_image.dart';
import '../../core/design/main_button.dart';
import '../../core/design/main_text_field.dart';
import '../../core/design/main_text_style.dart';
import '../../features/edit_pass/bloc.dart';

class EditPassScreen extends StatefulWidget {
  const EditPassScreen({Key? key}) : super(key: key);

  @override
  State<EditPassScreen> createState() => _EditPassScreenState();
}

class _EditPassScreenState extends State<EditPassScreen> {
  final bloc = KiwiContainer().resolve<EditPassBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const Logo(),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 19.w, bottom: 10.h),
              child: const MainTextStyle(text: 'تغير كلمة المرور',fontSize: 16),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(children: [
                MainTextField(
                    text: 'كلمة المرور القديمة',
                    prefixIcon: 'assets/icons/png/pass.png',
                    isObscure: true,
                    controller: bloc.passController,
                    type: InputType.pass),
                MainTextField(
                    text: 'كلمة المرور الجديدة',
                    prefixIcon: 'assets/icons/png/pass.png',
                    isObscure: true,
                    controller: bloc.confirmPassController,
                    type: InputType.pass),
              ]),
            ),
            BlocConsumer(
              bloc: bloc,
              listener: (context, state) {
                if (state is EditPassSuccessState) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return MainButton(
                    text: 'تغيير كلمة المرور',
                    isLoading: state is EditPassLoadingState,
                    onPressed: () {
                      bloc.add(EditPassEvent());
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
