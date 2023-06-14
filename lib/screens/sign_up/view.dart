import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/core/utils/app_routes.dart';
import 'package:thamra/core/utils/helper_methods.dart';
import 'package:thamra/core/widgets/btn.dart';
import 'package:thamra/core/widgets/input.dart';
import 'package:thamra/core/widgets/logo_image.dart';
import 'package:thamra/core/widgets/text_for_login_or_signup.dart';
import 'package:thamra/core/widgets/text_under_logo.dart';
import 'package:thamra/features/sign_up/sign_up_cubit.dart';

import '../../features/get_cities/get_cities_cubit.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final getCitiesCubit = KiwiContainer().resolve<GetCitiesCubit>()..getCities();
  final signUpCubit = KiwiContainer().resolve<SignUpCubit>();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final passController = TextEditingController();

  final confirmPassController = TextEditingController();

  final cityController = TextEditingController();

  String cityId = CacheHelper.getCityId();

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
            padding: EdgeInsetsDirectional.only(start: 16.w, bottom: 10.h),
            child: TextUnderLogo(text: 'مرحبا بك مرة أخرى'),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w, bottom: 22.h),
            child: Text(
              'يمكنك تسجيل حساب جديد الأن',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff707070)),
            ),
          ),
          Input(
            text: 'اسم المستخدم',
            prefixIcon: 'assets/icons/man.png',
            type: InputType.normal,
            controller: nameController,
          ),
          Input(
            text: 'رقم الجوال',
            prefixIcon: 'assets/icons/phone.png',
            type: InputType.phone,
            controller: phoneController,
          ),
          StatefulBuilder(builder: (context, setState) {
            return Input(
              text: "المدينة",
              prefixIcon: "assets/icons/city.png",
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
                            bloc: getCitiesCubit,
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
                                                cityId = state.list[index].id;
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
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(.05)),
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
                  cityController.text = result;
                }
                setState(() {});
              },
              controller: cityController,
            );
          }),
          Input(
            text: 'كلمة المرور',
            prefixIcon: 'assets/icons/pass.png',
            isObscure: true,
            type: InputType.pass,
            controller: passController,
          ),
          Input(
            text: 'كلمة المرور',
            prefixIcon: 'assets/icons/pass.png',
            isObscure: true,
            type: InputType.pass,
            controller: confirmPassController,
          ),
          BlocConsumer(
            bloc: signUpCubit,
            listener: (context, state) {
              if (state is SignUpSuccessState) {
                showToast(message: state.msg, context: context);
                CacheHelper.savePhoneFromRegister(
                    phone: phoneController.text);
                GoRouter.of(context).push(AppRoutes.activateAccount);
              }
              if (state is SignUpFailedState) {
                showToast(message: state.msg, context: context);
              }
            },
            builder: (context, state) {
              return Builder(builder: (context) {
                SignUpCubit cubit = BlocProvider.of(context);
                return Btn(
                    isLoading: state is SignUpLoadingState,
                    text: 'تسجيل',
                    onPressed: () async {
                      if (passController.text == confirmPassController.text) {
                        await cubit.signUp(
                            name: nameController.text,
                            phone: phoneController.text,
                            pass: passController.text,
                            confirmPass: confirmPassController.text,
                            city: cityController.text);
                      }
                    });
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
    ));
  }
}
