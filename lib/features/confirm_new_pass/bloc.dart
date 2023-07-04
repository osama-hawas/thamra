import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/core/data/service/dio_helper.dart';

import 'states.dart';
import 'events.dart';

class ConfirmNewPassBloc extends Bloc<NewPassEvents, ConfirmNewPassState> {
  final DioHelper dioHelper;

  final passController = TextEditingController();

  final confirmPassController = TextEditingController();

  ConfirmNewPassBloc(this.dioHelper) : super(ConfirmNewPassState()) {
    on<ConfirmNewPassEvent>(_confirmNewPass);
  }

  void _confirmNewPass(ConfirmNewPassEvent event,
      Emitter<ConfirmNewPassState> emit) async {
    emit(ConfirmNewPassLoadingState());
    final response = await dioHelper.post("reset_password", data: {
      "phone": CacheHelper.showPhoneFromRegister(),
      "code": CacheHelper.getCode(),
      "password": passController.text,
    });
    if (response.isSuccess) {
      emit(ConfirmNewPassSuccessState(msg: response.message));
    } else {
      emit(ConfirmNewPassFailedState(msg: response.message));
    }
  }
}
