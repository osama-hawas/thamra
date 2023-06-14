import 'package:bloc/bloc.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/core/data/service/dio_helper.dart';

import 'confirm_new_pass_state.dart';

class ConfirmNewPassCubit extends Cubit<ConfirmNewPassState> {
  ConfirmNewPassCubit() : super(ConfirmNewPassState());

  void confirmNewPass({required pass}) async {
    emit(ConfirmNewPassLoadingState());
    final response = await DioHelper.post("reset_password", data: {
      "phone": CacheHelper.showPhoneFromRegister(),
      "code": CacheHelper.getCode(),
      "password": pass,
    });
    if (response.isSuccess) {
      emit(ConfirmNewPassSuccessState());
    } else {
      emit(ConfirmNewPassFailedState());
    }
  }
}
