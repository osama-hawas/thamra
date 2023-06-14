import 'package:bloc/bloc.dart';
import 'package:thamra/core/data/service/dio_helper.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit() : super(ForgetPassState());

  void forgetPass({required String phone}) async {
    emit(ForgetPassLoadingState());
    final response = await DioHelper.post("forget_password", data: {
      "phone": phone,
    });
    if (response.isSuccess) {
      emit(ForgetPassSuccessState(msg: response.message));
    } else {
      emit(ForgetPassFailedState(msg: response.message));
    }
  }
}
