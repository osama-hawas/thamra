import 'package:shared_preferences/shared_preferences.dart';
import 'package:thamra/screens/login/model.dart';

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

  static String getName() {
    return prefs.getString("fullname") ?? "user";
  }

  static String getImage() {
    return prefs.getString("image") ?? "";
  }

  static String getPhone() {
    return prefs.getString("phone") ?? "";
  }

  static String getUserToken() {
    return prefs.getString("token") ?? "";
  }
}
