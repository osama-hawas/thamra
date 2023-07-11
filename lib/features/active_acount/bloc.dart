import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:thamra/core/logic/cache_helper.dart';
import 'package:thamra/core/logic/dio_helper.dart';

import '../../core/logic/helper_methods.dart';

part  'events.dart';

part 'states.dart';

class ActiveAccountBloc extends Bloc<AcountEvents, ActiveAcountState> {
  final DioHelper dioHelper;

   TextEditingController code = TextEditingController();

  ActiveAccountBloc(this.dioHelper) : super(ActiveAcountState()) {
    on<ActiveAcountEvent>(_send);
  }

  void _send(
      ActiveAcountEvent event, Emitter<ActiveAcountState> emit) async {
    emit(ActiveAcountLoadingState());
    final response = await dioHelper.post("verify", data: {
      "code": code.text,
      "phone": CacheHelper.showPhoneFromRegister(),
      "device_token": FirebaseMessaging.instance.getToken().then((value) {
        CacheHelper.saveDeviceToken(deviceToken: value!);
      }),
      "type": Platform.operatingSystem,
    });
    if (response.isSuccess) {

      emit(ActiveAcountSuccessState(msg: response.message));
    } else {
      emit(ActiveAcountFailedState(msg: response.message));
    }
  }
}
