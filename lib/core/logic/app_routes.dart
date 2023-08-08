import 'package:go_router/go_router.dart';
import 'package:thamra/screens/cart/view.dart';
import 'package:thamra/screens/authentication/confirm_new_pass.dart';
import 'package:thamra/screens/authentication/confirm_pass_code.dart';
import 'package:thamra/screens/home_pages/home/view.dart';
import 'package:thamra/screens/home_pages/view.dart';
import 'package:thamra/screens/authentication/login.dart';
import 'package:thamra/screens/profile_pages/about_app.dart';
import 'package:thamra/screens/profile_pages/add_address.dart';
import 'package:thamra/screens/profile_pages/addreses.dart';
import 'package:thamra/screens/profile_pages/faqs.dart';
import 'package:thamra/screens/profile_pages/paiment.dart';
import 'package:thamra/screens/profile_pages/privacy.dart';
import 'package:thamra/screens/profile_pages/profile_info.dart';
import 'package:thamra/screens/profile_pages/suggestions.dart';
import 'package:thamra/screens/profile_pages/wallet.dart';
import 'package:thamra/screens/authentication/sign_up.dart';
import 'package:thamra/screens/authentication/splach.dart';
import '../../screens/authentication/active_account.dart';
import '../../screens/authentication/forget_pass.dart';
import '../../screens/profile_pages/be_vip.dart';
import '../../screens/profile_pages/change_lang.dart';
import '../../screens/profile_pages/contact.dart';
import '../../screens/profile_pages/paiement_now_from_wallet.dart';
import '../../screens/profile_pages/transaction_history_from_wallet.dart';

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
  static String catigories = '/catigories';
  static String cart = '/cart';
  static String vip = '/vip';
  static String paiementNowScreen = '/PaiementNowScreen';
  static String transactionHistory = '/transactionHistory';
  static GoRouter router = GoRouter(routes: [
    GoRoute(
      path: splach,
      builder: (context, state) => const SplachScreen(),
    ),
    GoRoute(
      path: login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: signUp,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: forgetPass,
      builder: (context, state) => const ForgetPassScreen(),
    ),
    GoRoute(
      path: passCode,
      builder: (context, state) => const ConfirmPassCodeScreen(),
    ),
    GoRoute(
      path: confirmNewPass,
      builder: (context, state) => const ConfirmNewPassScreen(),
    ),
    GoRoute(
      path: home,
      builder: (context, state) => const NavView(),
    ),
    GoRoute(
      path: activateAccount,
      builder: (context, state) => const ActivateAccountScreen(),
    ),
    GoRoute(
      path: suggestionPage,
      builder: (context, state) => const SuggestionsScreen(),
    ),
    GoRoute(
      path: aboutApp,
      builder: (context, state) => const AboutAppScreen(),
    ),
    GoRoute(
      path: privacyscreen,
      builder: (context, state) => const PrivacyScreen(),
    ),
    GoRoute(
      path: profileinfo,
      builder: (context, state) => const ProfileInfoScreen(),
    ),
    GoRoute(
      path: wallet,
      builder: (context, state) => const WalletScreen(),
    ),
    GoRoute(
      path: adresses,
      builder: (context, state) => const AddressesScreen(),
    ),
    GoRoute(
      path: paiements,
      builder: (context, state) => const PaiementsScreen(),
    ),
    GoRoute(
      path: faqs,
      builder: (context, state) => const FAQsScreen(),
    ),
    GoRoute(
      path: contentwithus,
      builder: (context, state) => const ConnectUsScreen(),
    ),
    GoRoute(
      path: shareapp,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: changelang,
      builder: (context, state) => const ChangeLangScreen(),
    ),
    GoRoute(
      path: strokeandtightness,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: rateapp,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: addAddress,
      builder: (context, state) => const AddAddressScreen(),
    ),
    GoRoute(
      path: vip,
      builder: (context, state) => const VipScreen(),
    ),
    GoRoute(
      path: cart,
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: paiementNowScreen,
      builder: (context, state) => const PaiementNowScreen(),
    ), GoRoute(
      path: transactionHistory,
      builder: (context, state) => const TransactionsHistoryScreen(),
    ),
  ]);
}
