

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data/local/cache_helper.dart';
import '../../core/data/service/dio_helper.dart';
import 'model.dart';
import 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStates());
  final phoneController = TextEditingController(text: "01008125361");
  final passController = TextEditingController(text: "123456789");

  Future<void> login() async {
    emit(LoginLoadingStates());
    final resp = await DioHelper.post("login", data: {
      'phone': phoneController.text,
      'password': passController.text,
      'device_token':CacheHelper.getDeviceToken(),
      'type': Platform.operatingSystem,
      'user_type': "client",
    });
    if (resp.isSuccess) {
      final model = LoginDataModel.fromJson(json: resp.response!.data);
      emit(LoginSuccessStates());
      CacheHelper.saveUserData(model);
      // showToast(message:resp.message);

    } else {
      // showToast(message: resp.message);
      emit(LoginFailedStates(msg: "${resp.message}"));
    }
  }
}
