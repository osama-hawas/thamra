
import 'package:flutter/material.dart';
 final navKey = GlobalKey<NavigatorState>();
GlobalKey<FormState> formkey = GlobalKey();

void showToast({required String message,required  context}) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message),));
}
