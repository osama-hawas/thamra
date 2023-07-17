import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/core/logic/cache_helper.dart';
import 'package:thamra/core/logic/dio_helper.dart';

import '../../core/logic/helper_methods.dart';

part 'events.dart';

part 'states.dart';

class ConfirmNewPassBloc extends Bloc<NewPassEvents, ConfirmNewPassState> {
  final DioHelper dioHelper;

  final passController = TextEditingController();

  final confirmPassController = TextEditingController();

  ConfirmNewPassBloc(this.dioHelper) : super(ConfirmNewPassState()) {
    on<ConfirmNewPassEvent>(_confirmNewPass);
  }

  void _confirmNewPass(
      ConfirmNewPassEvent event, Emitter<ConfirmNewPassState> emit) async {
    if (passController.text == confirmPassController.text) {
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
    } else {
      passController.clear();
      confirmPassController.clear();
      showMSG(message: "كلمة المرور غير متطابقة");
    }
  }
}
