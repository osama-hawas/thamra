import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/core/data/service/dio_helper.dart';

import 'confirm_new_pass_state.dart';
import 'events.dart';

class ConfirmNewPassCubit extends Bloc<NewPass, ConfirmNewPassState> {
  final DioHelper dioHelper;

  final passController = TextEditingController();

  final confirmPassController = TextEditingController();

  ConfirmNewPassCubit(this.dioHelper) : super(ConfirmNewPassState()) {
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
