import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thamra/screens/home_pages/home/view.dart';

final navKey = GlobalKey<NavigatorState>();
// GlobalKey<FormState> formkey = GlobalKey();

void showToast({required String message, required context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}

void showMSG({required String message}) {
  if (message.isNotEmpty) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xff4C8613),
        textColor: Colors.white,
        fontSize: 18.sp);
  }


}
void navigateTo(BuildContext context, {required Widget route}) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => route,
      ));
}