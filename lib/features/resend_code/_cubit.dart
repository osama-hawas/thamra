import 'package:bloc/bloc.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/core/data/service/dio_helper.dart';

import '_state.dart';


class ResendCodeCubit extends Cubit<ResendCodeState> {
  ResendCodeCubit() : super(ResendCodeState());

  void resendCode() async {
    emit(ResendCodeLoadingState());
    final response = await DioHelper.post("resend_code",
        data: {"phone": CacheHelper.showPhoneFromRegister(),});
    if (response.isSuccess) {
      emit(ResendCodeSuccessState(msg: response.message));
    } else {
      emit(ResendCodeFailedState());
    }
  }
}
