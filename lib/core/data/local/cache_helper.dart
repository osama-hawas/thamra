import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/login/model.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void addTitle(title) async {
    prefs.setString("title", title);
  }

  static String showTitle() {
    return prefs.getString("title") ?? "";
  }

  static Future<void> removeTitle() async {
    prefs.remove('title');
  }
  static Future<void> savePhoneFromRegister({required String phone}) async {
    prefs.setString('registerphone',phone);
  }
  static String? showPhoneFromRegister() {
    return prefs.getString("registerphone") ;
  }

  static Future saveUserData(LoginDataModel model) async {
    prefs.setString("image", model.data.image);
    prefs.setString("phone", model.data.phone);
    prefs.setString("fullname", model.data.fullname);
    prefs.setString("email", model.data.email);
    prefs.setString("token", model.data.token);
    prefs.setInt("id", model.data.id);
    prefs.setInt("userCartCount", model.data.userCartCount);
    prefs.setString("cityId", model.data.city.id);
    prefs.setString("cityName", model.data.city.name);

  }

  static Future updateUserProfile({phone, name, cityId, cityName}) async {
    prefs.setString("phone", phone);
    prefs.setString("fullname", name);
    prefs.setString("cityId", cityId);
    prefs.setString("cityName", cityName);
  }

  static String? getCityName() {
    return prefs.getString("cityName") ;
  }

  static String getCityId() {
    return prefs.getString("cityId") ?? "0";
  }

  static String getName() {
    return prefs.getString("fullname") ?? "user";
  }

  static String getImage() {
    return prefs.getString("image") ??
        "https://sb.kaleidousercontent.com/67418/1920x1545/c5f15ac173/samuel-raita-ridxdghg7pw-unsplash.jpg";
  }

  static String getPhone() {
    return prefs.getString("phone") ?? "";
  }

  static String? getUserToken() {
    return prefs.getString("token");
  }
  static Future<void> saveDeviceToken({required String? deviceToken}) async {
    prefs.setString('deviceToken',deviceToken!);
  }
  static String? getDeviceToken() {
    return prefs.getString("deviceToken") ;
  }

  static Future<void> saveCode({required String? code}) async {
    prefs.setString('code',code!);
  }
  static String? getCode() {
    return prefs.getString("code") ;
  }




  static Future<void> logout() async {
   await prefs.clear();
  }
}
