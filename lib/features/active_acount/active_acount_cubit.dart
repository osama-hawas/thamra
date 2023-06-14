import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/core/data/service/dio_helper.dart';

part 'active_acount_state.dart';

class ActiveAcountCubit extends Cubit<ActiveAcountState> {
  ActiveAcountCubit() : super(ActiveAcountState());

  void activeAcount({
    required String code,
  }) async {
    emit(ActiveAcountLoadingState());
    final response = await DioHelper.post("verify", data: {
      "code": code,
      "phone": CacheHelper.showPhoneFromRegister(),
      "device_token": FirebaseMessaging.instance.getToken().then((value) {
       CacheHelper.saveDeviceToken(deviceToken:value );
      }),
      "type": Platform.operatingSystem,
    });
    if (response.isSuccess) {

      emit(ActiveAcountSuccessState());
    } else {
      emit(ActiveAcountFailedState());
    }
  }
}
