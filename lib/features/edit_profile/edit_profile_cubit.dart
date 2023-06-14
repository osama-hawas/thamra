import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:thamra/core/data/service/dio_helper.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileState());

  void updateProfile(
      {File? image, String? name, String? phone, String? cityId}) async {
    emit(EditProfileLoadingState());
    final response = await DioHelper.post("client/profile", data: {
      "image": image == null
          ? null
          : MultipartFile.fromFileSync(image.path,
              filename: image.path.split("/").last),
      "fullname": name,
      "phone": phone,
      "city_id": cityId,
    });
    if (response.isSuccess) {
      emit(EditProfileSuccessState(msg: response.response!.data["message"]));
    } else {
      emit(EditProfileFailedState());
    }
  }
}
