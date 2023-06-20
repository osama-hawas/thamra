import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:thamra/core/data/service/dio_helper.dart';
import 'package:thamra/features/forget_pass/forget_pass_event.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Bloc<ForgetPassEvents, ForgetPassState> {
  final DioHelper dioHelper;

  final phoneController = TextEditingController();

  ForgetPassCubit(this.dioHelper) : super(ForgetPassState()) {
    on<ForgetMyPassEvent>(_forgetPass);
  }

  void _forgetPass(
      ForgetMyPassEvent event, Emitter<ForgetPassState> emit) async {
    emit(ForgetPassLoadingState());
    final response = await dioHelper.post("forget_password", data: {
      "phone": phoneController.text,
    });
    if (response.isSuccess) {
      emit(ForgetPassSuccessState(msg: response.message));
    } else {
      emit(ForgetPassFailedState(msg: response.message));
    }
  }
}
