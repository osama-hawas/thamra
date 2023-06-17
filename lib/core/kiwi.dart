import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/data/service/dio_helper.dart';
import 'package:thamra/features/active_acount/active_acount_cubit.dart';
import 'package:thamra/features/confirm_new_pass/confirm_new_pass_cubit.dart';
import 'package:thamra/features/confirm_pass_code/bloc.dart';
import 'package:thamra/features/edit_profile/edit_profile_cubit.dart';
import 'package:thamra/features/forget_pass/forget_pass_cubit.dart';
import 'package:thamra/features/get_cities/get_cities_cubit.dart';
import 'package:thamra/features/resend_code/_cubit.dart';
import 'package:thamra/features/sign_up/sign_up_cubit.dart';
import 'package:thamra/screens/profile_pages/about_app/cubit.dart';

import '../features/login/login_bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();

  container.registerSingleton((c) => DioHelper());
  container.registerFactory((c) => AboutAppCubit());
  container.registerFactory((c) => ActiveAcountCubit());
  container.registerFactory((c) => ConfirmNewPassCubit());
  container.registerFactory((c) => ConfirmPassCodeCubit());
  container.registerFactory((c) => EditProfileCubit());
  container.registerFactory((c) => ForgetPassCubit());
  container.registerFactory((c) => GetCitiesCubit());
  container.registerFactory((c) => ResendCodeCubit());
  container.registerFactory((c) => SignUpCubit());
  container.registerFactory((c) => LoginBloc());
}
