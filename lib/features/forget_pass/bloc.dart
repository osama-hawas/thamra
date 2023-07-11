import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/core/logic/dio_helper.dart';

import '../../core/logic/helper_methods.dart';

part 'states.dart';
part 'events.dart';

class ForgetPassBloc extends Bloc<ForgetPassEvents, ForgetPassState> {
  final DioHelper dioHelper;

  final phoneController = TextEditingController();

  ForgetPassBloc(this.dioHelper) : super(ForgetPassState()) {
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
