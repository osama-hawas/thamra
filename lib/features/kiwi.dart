import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/logic/dio_helper.dart';
import 'package:thamra/features/about_app/bloc.dart';
import 'package:thamra/features/add_address/bloc.dart';
import 'package:thamra/features/cancel_order/bloc.dart';
import 'package:thamra/features/comleting_order/bloc.dart';
import 'package:thamra/features/confirm_new_pass/bloc.dart';
import 'package:thamra/features/confirm_pass_code/bloc.dart';
import 'package:thamra/features/delete_address/bloc.dart';
import 'package:thamra/features/edit_profile/bloc.dart';
import 'package:thamra/features/faqs/bloc.dart';
import 'package:thamra/features/forget_pass/bloc.dart';
import 'package:thamra/features/get_cities/bloc.dart';
import 'package:thamra/features/home_slider/bloc.dart';
import 'package:thamra/features/resend_code/bloc.dart';
import 'package:thamra/features/show_cart/bloc.dart';
import 'package:thamra/features/sign_up/bloc.dart';
import 'package:thamra/features/update_item_cart_amount/bloc.dart';

import 'active_acount/bloc.dart';
import 'add_product_rate/bloc.dart';
import 'add_to_cart/bloc.dart';
import 'contact/bloc.dart';
import 'delete_from_cart/bloc.dart';
import 'edit_pass/bloc.dart';
import 'fav/bloc.dart';
import 'get_addresses/bloc.dart';
import 'get_categories/bloc.dart';
import 'get_catigory_product/bloc.dart';
import 'get_order/bloc.dart';
import 'get_product/bloc.dart';
import 'is_fav/bloc.dart';
import 'login/bloc.dart';
import 'logout/bloc.dart';
import 'notifications/bloc.dart';
import 'privacy/bloc.dart';
import 'product_rate/bloc.dart';
import 'suggestions/bloc.dart';

void initKiwi() {
  final container = KiwiContainer();

  container.registerSingleton((c) => DioHelper());
  container.registerSingleton((c) => AboutAppBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => ActiveAccountBloc(c.resolve<DioHelper>()));
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
  container.registerFactory((c) => CreateContactBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => PrivacyBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => CategoriesBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetProductsBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => AddToCartBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetAddressesBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => DeleteAddressesBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => AddAddressBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetFavBloc(c.resolve<DioHelper>()));
  container
      .registerFactory((c) => GetNotificationsBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetOrdersBloc(c.resolve<DioHelper>()));
  container
      .registerFactory((c) => GetCatigoryProductBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetProductRateBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => FAQsBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => GetContactBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => IsFavBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => ShowCartBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => DeleteFromCartBloc(c.resolve<DioHelper>()));
  container
      .registerFactory((c) => UpdateCartAmountBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => EditPassBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => AddProductRateBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => CancelOrderBloc(c.resolve<DioHelper>()));
  container.registerFactory((c) => CompletingOrderBloc(c.resolve<DioHelper>()));
}
