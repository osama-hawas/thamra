import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/logic/cache_helper.dart';
import 'package:thamra/core/logic/app_routes.dart';

import 'package:thamra/features/sign_up/bloc.dart';

import '../../core/design/logo_image.dart';
import '../../core/design/main_button.dart';
import '../../core/design/main_text_field.dart';
import '../../core/design/main_text_style.dart';
import '../../core/design/text_for_login_or_signup.dart';
import '../../features/get_cities/bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final getCitiesBloc = KiwiContainer().resolve<GetCitiesBloc>()
    ..add(GetCitiesEvent());
  final bloc = KiwiContainer().resolve<SignUpBloc>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: bloc.formKey,
      child: SafeArea(
          child: Scaffold(
        body: ListView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          children: [
            const Logo(),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 16.w, bottom: 10.h),
              child: const MainTextStyle(text: 'مرحبا بك مرة أخرى'),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 16.w, bottom: 22.h),
              child: Text(
                'يمكنك تسجيل حساب جديد الأن',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff707070)),
              ),
            ),
            MainTextField(
              text: 'اسم المستخدم',
              prefixIcon: 'assets/icons/png/man.png',
              type: InputType.normal,
              controller: bloc.nameController,
            ),
            MainTextField(
              text: 'رقم الجوال',
              prefixIcon: 'assets/icons/png/phone.png',
              type: InputType.phone,
              controller: bloc.phoneController,
            ),
            StatefulBuilder(builder: (context, setState) {
              return MainTextField(
                text: "المدينة",
                prefixIcon: "assets/icons/png/city.png",
                onPress: () async {
                  var result = await showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.r),
                        topRight: Radius.circular(32.r),
                      ),
                    ),
                    context: context,
                    builder: (context) => Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.all(12.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Select Your City :",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).hintColor),
                          ),
                          Expanded(
                            child: BlocBuilder(
                              bloc: getCitiesBloc,
                              builder: (context, state) {
                                if (state is GetCitiesLoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is GetCitiesFailedState) {
                                  return Center(
                                    child: Text(
                                      "Sorry .Try again later",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).hintColor),
                                    ),
                                  );
                                } else if (state is GetCitiesSuccessState) {
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                          state.list.length,
                                          (index) => GestureDetector(
                                                onTap: () {
                                                  bloc.cityId =
                                                      state.list[index].id;
                                                  GoRouter.of(context).pop(
                                                      state.list[index].name);
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.all(8.r),
                                                  padding: EdgeInsets.all(16.r),
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.r),
                                                      color: state.list[index]
                                                                  .name ==
                                                              bloc.cityController
                                                                  .text
                                                          ? Theme.of(context)
                                                              .primaryColor
                                                              .withOpacity(.5)
                                                          : Theme.of(context)
                                                              .primaryColor
                                                              .withOpacity(
                                                                  .05)),
                                                  child: Text(
                                                    state.list[index].name,
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Theme.of(context)
                                                            .hintColor),
                                                  ),
                                                ),
                                              )),
                                    ),
                                  );
                                } else {
                                  return const Text("wrong");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                  if (result != null) {
                    bloc.cityController.text = result;
                  }
                  setState(() {});
                },
                controller: bloc.cityController,
              );
            }),
            MainTextField(
              text: 'كلمة المرور',
              prefixIcon: 'assets/icons/png/pass.png',
              isObscure: true,
              type: InputType.pass,
              controller: bloc.passController,
            ),
            MainTextField(
              text: 'كلمة المرور',
              prefixIcon: 'assets/icons/png/pass.png',
              isObscure: true,
              type: InputType.pass,
              controller: bloc.confirmPassController,
            ),
            BlocConsumer(
              bloc: bloc,
              listener: (context, state) {
                if (state is SignUpSuccessState) {
                  CacheHelper.savePhoneFromRegister(
                      phone: bloc.phoneController.text);
                  GoRouter.of(context).push(AppRoutes.activateAccount);
                }

              },
              builder: (context, state) {
                return MainButton(
                    isLoading: state is SignUpLoadingState,
                    text: 'تسجيل',
                    onPressed: ()  {
                      bloc.add(ClientSignUpEvent());
                    });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 45.h),
              child: TextForLoginOrSignup(
                text: 'لديك حساب بالفعل ؟',
                signText: 'تسجيل الدخول',
                onTap: () {
                  GoRouter.of(context).pop();
                },
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      )),
    );
  }
}
