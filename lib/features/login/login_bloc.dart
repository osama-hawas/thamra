

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data/local/cache_helper.dart';
import '../../core/data/service/dio_helper.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'model.dart';



class LoginBloc extends Bloc<LoginEvent,LoginStates> {
  LoginBloc() : super(LoginStates()){
    on<LoginEvent>(_login);
  }


  final phoneController = TextEditingController(text: "01008125361");
  final passController = TextEditingController(text: "123456789");

  Future<void> _login(LoginEvent event ,Emitter<LoginStates> emit) async {
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