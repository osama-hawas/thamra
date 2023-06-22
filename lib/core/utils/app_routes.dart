import 'package:go_router/go_router.dart';
import 'package:thamra/screens/confirm_new_pass/view.dart';
import 'package:thamra/screens/confirm_pass_code/view.dart';
import 'package:thamra/screens/home_pages/home/view.dart';
import 'package:thamra/screens/home_pages/notifications/view.dart';
import 'package:thamra/screens/home_pages/view.dart';
import 'package:thamra/screens/login/view.dart';
import 'package:thamra/screens/profile_pages/about_app/view.dart';
import 'package:thamra/screens/profile_pages/add_address/view.dart';
import 'package:thamra/screens/profile_pages/addresses/view.dart';
import 'package:thamra/screens/profile_pages/faqs/view.dart';
import 'package:thamra/screens/profile_pages/paiement/view.dart';
import 'package:thamra/screens/profile_pages/privacy/view.dart';
import 'package:thamra/screens/profile_pages/profile_info/view.dart';
import 'package:thamra/screens/profile_pages/suggestions/view.dart';
import 'package:thamra/screens/profile_pages/wallet/view.dart';
import 'package:thamra/screens/sign_up/view.dart';
import 'package:thamra/screens/splach/view.dart';

import '../../screens/activate_account/view.dart';
import '../../screens/forget_pass/view.dart';
import '../../screens/profile_pages/change_lang/change_lang.dart';
import '../../screens/profile_pages/contact/view.dart';

abstract class AppRoutes {
  static String splach = '/';

  static String login = '/login';
  static String signUp = '/signup';
  static String suggestionPage = '/suggestionPage';
  static String forgetPass = '/forgetpass';
  static String confirmNewPass = '/confirmnewpass';
  static String activateAccount = '/activeaccount';
  static String home = '/home';
  static String passCode = '/passcode';
  static String aboutApp = '/aboutapp';
  static String privacyscreen = '/privacyscreen';
  static String profileinfo = '/profileinfo';
  static String wallet = '/wallet';
  static String adresses = '/adresses';
  static String paiements = '/Paiements';
  static String faqs = '/faqs';
  static String contentwithus = '/contentwithus';
  static String shareapp = '/shareapp';
  static String changelang = '/changelang';
  static String strokeandtightness = '/strokeandtightness';
  static String rateapp = '/rateapp';
  static String addAddress = '/addAddress';
  static GoRouter router = GoRouter(routes: [
    GoRoute(
      path: splach,
      builder: (context, state) =>  SplachScreen(),
    ),
    GoRoute(
      path: login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: signUp,
      builder: (context, state) =>  SignUpScreen(),
    ),
    GoRoute(
      path: forgetPass,
      builder: (context, state) =>  ForgetPassScreen(),
    ),
    GoRoute(
      path: passCode,
      builder: (context, state) =>  ConfirmPassCodeScreen(),
    ),
    GoRoute(
      path: confirmNewPass,
      builder: (context, state) =>  ConfirmNewPassScreen(),
    ),
    GoRoute(
      path: home,
      builder: (context, state) => NavView(),
    ),
    GoRoute(
      path: activateAccount,
      builder: (context, state) => ActivateAccountScreen(),
    ),
    GoRoute(
      path: suggestionPage,
      builder: (context, state) => SuggestionsScreen(),
    ),
    GoRoute(
      path: aboutApp,
      builder: (context, state) => AboutAppScreen(),
    ),
    GoRoute(
      path: privacyscreen,
      builder: (context, state) => PrivacyScreen(),
    ),




    GoRoute(
      path: profileinfo,
      builder: (context, state) => ProfileInfoScreen(),
    ),
    GoRoute(
      path: wallet,
      builder: (context, state) =>const WalletScreen(),
    ),
    GoRoute(
      path: adresses,
      builder: (context, state) =>const AddressesScreen(),
    ),
    GoRoute(
      path: paiements,
      builder: (context, state) =>const PaiementsScreen(),
    ),
    GoRoute(
      path: faqs,
      builder: (context, state) =>const FAQsScreen(),
    ),
    GoRoute(
      path: contentwithus,
      builder: (context, state) => ConnectUsScreen(),
    ),
    GoRoute(
      path: shareapp,
      builder: (context, state) =>const HomeScreen(),
    ),
    GoRoute(
      path: changelang,
      builder: (context, state) => ChangeLangScreen(),
    ),
    GoRoute(
      path: strokeandtightness,
      builder: (context, state) =>const HomeScreen(),
    ),
    GoRoute(
      path: rateapp,
      builder: (context, state) =>const HomeScreen(),
    ),GoRoute(
      path: addAddress,
      builder: (context, state) =>const AddAddressScreen(),
    ),
  ]);
}
