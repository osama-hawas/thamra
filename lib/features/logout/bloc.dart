import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/features/logout/states.dart';

import '../../core/data/service/dio_helper.dart';
import 'events.dart';

class LogoutBloc extends Bloc<LogoutAcountEvents, LogoutStates> {
  final DioHelper dioHelper;

  LogoutBloc(this.dioHelper) : super(LogoutStates()) {
    on<LogoutEvent>(_logout);
  }

  void _logout(LogoutEvent event, Emitter<LogoutStates> emit) async {
    print(CacheHelper.getDeviceToken());
    print(FirebaseMessaging.instance.getToken());
    emit(LogoutLoadingState());
    final response = await dioHelper.post("logout", data: {
      "device_token": CacheHelper.getDeviceToken(),
      "type": Platform.operatingSystem,
    });
    if (response.isSuccess) {
      emit(LogoutSuccessState(msg: response.message));
      CacheHelper.logout();
    } else {
      emit(LogoutFailedState(msg: response.message));
    }
  }
}
