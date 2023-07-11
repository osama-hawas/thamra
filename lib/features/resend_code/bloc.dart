import 'package:bloc/bloc.dart';
import 'package:thamra/core/logic/cache_helper.dart';
import 'package:thamra/core/logic/dio_helper.dart';

import '../../core/logic/helper_methods.dart';

part 'states.dart';
part 'events.dart';


class ResendCodeBloc extends Bloc<CodeEvents,ResendCodeStates> {
  final DioHelper dioHelper;

  ResendCodeBloc(this.dioHelper) : super(ResendCodeStates()){
    on<ResendCodeEvent>(_resendCode);
  }

  void _resendCode(ResendCodeEvent event , Emitter<ResendCodeStates> emit) async {
    emit(ResendCodeLoadingState());
    final response = await dioHelper.post("resend_code",
        data: {"phone": CacheHelper.showPhoneFromRegister(),});
    if (response.isSuccess) {
      emit(ResendCodeSuccessState(msg: response.message));
    } else {
      emit(ResendCodeFailedState());
    }
  }
}
