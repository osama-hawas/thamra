
import 'package:flutter/material.dart';
 final navKey = GlobalKey<NavigatorState>();

void showToast({required String message,required  context}) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message),));
}
