import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/data/service/dio_helper.dart';
import 'package:thamra/features/about_app/bloc.dart';
import 'package:thamra/features/active_acount/bloc.dart';
import 'package:thamra/features/add_address/bloc.dart';
import 'package:thamra/features/confirm_new_pass/bloc.dart';
import 'package:thamra/features/confirm_pass_code/bloc.dart';
import 'package:thamra/features/delete_address/bloc.dart';
import 'package:thamra/features/edit_profile/bloc.dart';
import 'package:thamra/features/forget_pass/forget_pass_cubit.dart';
import 'package:thamra/features/get_cities/bloc.dart';
import 'package:thamra/features/home_slider/bloc.dart';
import 'package:thamra/features/resend_code/bloc.dart';
import 'package:thamra/features/sign_up/bloc.dart';

import '../features/add_to_cart/bloc.dart';
import '../features/fav/bloc.dart';
import '../features/get_addresses/bloc.dart';
import '../features/get_categories/bloc.dart';
import '../features/get_catigory_product/bloc.dart';
import '../features/get_order/bloc.dart';
import '../features/get_product/bloc.dart';
import '../features/login/bloc.dart';
import '../features/logout/bloc.dart';
import '../features/notifications/bloc.dart';
import '../features/privacy/bloc.dart';
import '../features/suggestions/bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();

  container.registerSingleton((c) => DioHelper());
  container.registerFactory((c) => AboutAppBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => ActiveAcountBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => ConfirmNewPassBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => ConfirmPassCodeBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => EditProfileBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => ForgetPassBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetCitiesBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => ResendCodeBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => SignUpBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => LoginBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => HomeSliderBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => LogoutBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => SuggestionBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => PrivacyBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => CategoriesBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetProductsBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => AddToCartBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetAddressesBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => DeleteAddressesBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => AddAddressBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetFavBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetNotificationsBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetOrdersBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetCatigoryProductBloc(c.resolve<DioHelper>()));
}
