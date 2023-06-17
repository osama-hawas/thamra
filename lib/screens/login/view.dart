import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/utils/app_routes.dart';
import 'package:thamra/core/utils/helper_methods.dart';
import 'package:thamra/core/widgets/input.dart';
import 'package:thamra/core/widgets/text_for_login_or_signup.dart';
import 'package:thamra/features/login/login_bloc.dart';
import 'package:thamra/features/login/login_event.dart';
import '../../core/widgets/btn.dart';
import '../../core/widgets/logo_image.dart';
import '../../core/widgets/text_under_logo.dart';
import '../../features/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bloc = KiwiContainer().resolve<LoginBloc>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Logo(),
              Padding(
                padding:
                const EdgeInsetsDirectional.only(start: 16, bottom: 10),
                child: TextUnderLogo(text: 'مرحبا بك مرة أخرى'),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.only(start: 16, bottom: 28),
                child: Text(
                  'يمكنك تسجيل الدخول الأن',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff707070)),
                ),
              ),
              Input(
                  controller: bloc.phoneController,
                  text: 'رقم الجوال ',
                  prefixIcon: 'assets/icons/phone.png',
                  type: InputType.phone),
              Input(
                controller: bloc.passController,
                text: 'كلمة المرور',
                prefixIcon: 'assets/icons/pass.png',
                isObscure: true,
                type: InputType.pass,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        end: 16, bottom: 22),
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRoutes.forgetPass);
                      },
                      child: const Text(
                        'نسيت كلمة المرور ؟',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff707070)),
                      ),
                    ),
                  ),
                ],
              ),
              BlocConsumer(
                  listener: (context, state) {
                    if (state is LoginSuccessStates) {
                      GoRouter.of(context).push(AppRoutes.home);
                      // showToast(message: "تم تسجيل الدخول بنجاح", context: context);
                      showMSG(message: "تم تسجيل الدخول بنجاح" );
                    }
                    if (state is LoginFailedStates) {
                      showToast(message: state.msg, context: context);
                    }
                  },
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is LoginLoadingStates) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Btn(
                        text: 'تسجيل الدخول',
                        onPressed: () {
                          bloc.add(LoginEvent());
                        },
                      );
                    }
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: TextForLoginOrSignup(
                    text: 'ليس لديك حساب ؟',
                    signText: ' تسجيل الأن',
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.signUp);
                    }),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
