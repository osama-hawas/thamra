import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/data/service/dio_helper.dart';
import 'package:thamra/features/active_acount/active_acount_cubit.dart';
import 'package:thamra/features/confirm_new_pass/confirm_new_pass_cubit.dart';
import 'package:thamra/features/confirm_pass_code/bloc.dart';
import 'package:thamra/features/edit_profile/edit_profile_cubit.dart';
import 'package:thamra/features/forget_pass/forget_pass_cubit.dart';
import 'package:thamra/features/get_cities/get_cities_cubit.dart';
import 'package:thamra/features/home_slider/home_slider_bloc.dart';
import 'package:thamra/features/resend_code/_cubit.dart';
import 'package:thamra/features/sign_up/sign_up_cubit.dart';
import 'package:thamra/screens/profile_pages/about_app/cubit.dart';

import '../features/add_to_cart/bloc.dart';
import '../features/get_categories/bloc.dart';
import '../features/get_product/bloc.dart';
import '../features/login/login_bloc.dart';
import '../features/logout/bloc.dart';
import '../features/privacy/bloc.dart';
import '../features/suggestions/bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();

  container.registerSingleton((c) => DioHelper());
  container.registerFactory((c) => AboutAppCubit(c.resolve<DioHelper>()));
  container.registerFactory((c) => ActiveAcountCubit(c.resolve<DioHelper>()));
  container.registerFactory((c) => ConfirmNewPassCubit(c.resolve<DioHelper>()));
  container.registerFactory((c) => ConfirmPassCodeCubit(c.resolve<DioHelper>()));
  container.registerFactory((c) => EditProfileCubit(c.resolve<DioHelper>()));
  container.registerFactory((c) => ForgetPassCubit(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetCitiesCubit(c.resolve<DioHelper>()));
  container.registerFactory((c) => ResendCodeCubit(c.resolve<DioHelper>()));
  container.registerFactory((c) => SignUpCubit(c.resolve<DioHelper>()));
  container.registerFactory((c) => LoginBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => HomeSliderBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => LogoutBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => SuggestionBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => PrivacyBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => CategoriesBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetProductsBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => AddToCartBloc(c.resolve<DioHelper>()));

}
