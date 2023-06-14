import 'package:bloc/bloc.dart';

import '../../core/data/service/dio_helper.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

   signUp({
    required String name,
    required String phone,
    required String pass,
    required String confirmPass,
    required String city,
  }) async {
    emit(SignUpLoadingState());
    final response = await DioHelper.post(
      "client_register",
      data: {
        "fullname": name,
        "phone": phone,
        "password": pass,
        "password_confirmation": confirmPass,
        "city":city,
      },
    );
    if (response.isSuccess) {
      emit(SignUpSuccessState(msg: response.message));
    } else {
      emit(SignUpFailedState(msg: response.message));
    }
  }
}
