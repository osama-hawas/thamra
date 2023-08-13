import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/core/logic/dio_helper.dart';

import '../../core/logic/helper_methods.dart';

part 'states.dart';

part 'events.dart';

class EditPassBloc extends Bloc<EditPassEvents, EditPassState> {
  final passController = TextEditingController();

  final confirmPassController = TextEditingController();

  final DioHelper dioHelper;

  EditPassBloc(this.dioHelper) : super(EditPassState()) {
    on<EditPassEvent>(_updateProfile);
  }

  void _updateProfile(EditPassEvent event, Emitter<EditPassState> emit) async {

    if (passController.text == confirmPassController.text &&
        passController.text != "" &&
        passController.text != "") {
      emit(EditPassLoadingState());
      final response = await dioHelper.post("edit_password", data: {
        "old_password": passController.text,
        "password": confirmPassController.text
      });
      if (response.isSuccess) {
        emit(EditPassSuccessState(msg: response.response!.data["message"]));
      } else {
        emit(EditPassFailedState(msg: response.response!.data["message"]));
      }
    } else {
      showMSG(message: "كلمة المرور غير متطابقه");
    }
  }
}
