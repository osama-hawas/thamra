import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data/local/cache_helper.dart';
import '../../core/data/service/dio_helper.dart';
import 'events.dart';
import 'states.dart';
import 'model.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final DioHelper dioHelper;

  LoginBloc(this.dioHelper) : super(LoginStates()) {
    on<LoginEvents>(_login);
  }

  final phoneController = TextEditingController(text: "550011223344");
  final passController = TextEditingController(text: "123456789");

  Future<void> _login(LoginEvents event, Emitter<LoginStates> emit) async {
    final deviceToken = await FirebaseMessaging.instance.getToken();
    CacheHelper.saveDeviceToken(deviceToken: deviceToken);
    emit(LoginLoadingStates());
    final resp = await dioHelper.post("login", data: {
      'phone': phoneController.text,
      'password': passController.text,
      'device_token': deviceToken,
      'type': Platform.operatingSystem,
      'user_type': "client",
    });
    if (resp.isSuccess) {
      final model = LoginDataModel.fromJson(json: resp.response!.data);
      emit(LoginSuccessStates(msg: resp.message));
      CacheHelper.saveUserData(model);
      // showToast(message:resp.message);

    } else {
      // showToast(message: resp.message);
      emit(LoginFailedStates(msg: resp.message));
    }
  }
}
