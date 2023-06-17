import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:thamra/features/sign_up/sign_up_event.dart';

import '../../core/data/local/cache_helper.dart';
import '../../core/data/service/dio_helper.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Bloc<SignUpEvent, SignUpStates> {
  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final passController = TextEditingController();

  final confirmPassController = TextEditingController();

  final cityController = TextEditingController();

  String cityId = CacheHelper.getCityId();

  SignUpCubit() : super(SignUpStates()){
    on<ClientSignUpEvent>(_signUp);
  }

 void _signUp(SignUpEvent event,Emitter<SignUpStates> emit) async {
    emit(SignUpLoadingState());
    final response = await DioHelper.post(
      "client_register",
      data: {
        "fullname": nameController.text,
        "phone": phoneController.text,
        "password": passController.text,
        "password_confirmation": confirmPassController.text,
        "city": cityController.text,
      },
    );
    if (response.isSuccess) {
      emit(SignUpSuccessState(msg: response.message));
    } else {
      emit(SignUpFailedState(msg: response.message));
    }
  }
}
