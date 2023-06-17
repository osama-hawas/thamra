import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/core/data/service/dio_helper.dart';

import 'events.dart';

part 'states.dart';

class ConfirmPassCodeCubit extends Bloc<PassCodeEvents, ConfirmPassCodeState> {
   String? code;
  ConfirmPassCodeCubit() : super(ConfirmPassCodeState()){
    on<ConfirmPassCodeEvent>(_confirmPassCode);
  }

  void _confirmPassCode(ConfirmPassCodeEvent event, Emitter<ConfirmPassCodeState> emit) async {
    emit(ConfirmPassCodeLoadingState());
    final response = await DioHelper.post("check_code", data: {
      "phone": CacheHelper.showPhoneFromRegister(),
      "code": code,
    });
    if (response.isSuccess) {
      emit(ConfirmPassCodeSuccessState());
    } else {
      emit(ConfirmPassCodeFailedState());
    }
  }
}
