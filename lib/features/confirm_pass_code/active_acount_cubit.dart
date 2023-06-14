import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/core/data/service/dio_helper.dart';

part 'active_acount_state.dart';

class ConfirmPassCodeCubit extends Cubit<ConfirmPassCodeState> {
  ConfirmPassCodeCubit() : super(ConfirmPassCodeState());

  void confirmPassCode({
    required String code,
  }) async {
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
