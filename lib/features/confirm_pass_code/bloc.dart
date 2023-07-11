
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:thamra/core/logic/cache_helper.dart';
import 'package:thamra/core/logic/dio_helper.dart';

import '../../core/logic/helper_methods.dart';


part 'states.dart';
part 'events.dart';

class ConfirmPassCodeBloc extends Bloc<PassCodeEvents, ConfirmPassCodeState> {
  final DioHelper dioHelper;

  final code=TextEditingController();
  ConfirmPassCodeBloc(this.dioHelper) : super(ConfirmPassCodeState()){
    on<ConfirmPassCodeEvent>(_confirmPassCode);
  }

  void _confirmPassCode(ConfirmPassCodeEvent event, Emitter<ConfirmPassCodeState> emit) async {
    emit(ConfirmPassCodeLoadingState());
    final response = await dioHelper.post("check_code", data: {
      "phone": CacheHelper.showPhoneFromRegister(),
      "code": code.text,
    });
    if (response.isSuccess) {
      emit(ConfirmPassCodeSuccessState());
    } else {
      emit(ConfirmPassCodeFailedState());
    }
  }
}
