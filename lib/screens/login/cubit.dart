import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/core/data/service/dio_helper.dart';
import 'package:thamra/screens/login/model.dart';
import 'package:thamra/screens/login/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStates());
  final phoneController = TextEditingController(text: "96655001122334455");
  final passController = TextEditingController(text: "123456789");

  Future<void> login() async {
    emit(LoginLoadingStates());
    final resp = await DioHelper.post("login", data: {
      'phone': phoneController.text,
      'password': passController.text,
      'device_token': "test",
      'type': Platform.operatingSystem,
      'user_type': "client",
    });
    if (resp.isSuccess) {
      final model = LoginDataModel.fromJson(json: resp.response!.data);
      CacheHelper.saveUserData(model);
      // showToast(message:resp.message);
      emit(LoginSuccessStates());
    } else {
      // showToast(message: resp.message);
      emit(LoginFailedStates(msg: "${resp.message}"));
    }
  }
}
