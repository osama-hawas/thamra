import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/cache_helper.dart';
import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';

part 'states.dart';
part 'events.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  final DioHelper dioHelper;
  GlobalKey<FormState> formKey = GlobalKey();

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

   if (formKey.currentState!.validate()&&(passController.text ==
       confirmPassController.text)) {
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
}
