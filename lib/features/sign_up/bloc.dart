import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:thamra/features/sign_up/events.dart';

import '../../core/data/local/cache_helper.dart';
import '../../core/data/service/dio_helper.dart';

part 'states.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  final DioHelper dioHelper;

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final passController = TextEditingController();

  final confirmPassController = TextEditingController();

  final cityController = TextEditingController();

  String cityId = CacheHelper.getCityId();

  SignUpBloc(this.dioHelper) : super(SignUpStates()){
    on<ClientSignUpEvent>(_signUp);
  }

 void _signUp(SignUpEvents event,Emitter<SignUpStates> emit) async {
    emit(SignUpLoadingState());
    final response = await dioHelper.post(
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
