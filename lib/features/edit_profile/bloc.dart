import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/core/logic/dio_helper.dart';

import '../../core/logic/cache_helper.dart';
import '../../core/logic/helper_methods.dart';

part 'states.dart';
part 'events.dart';

class EditProfileBloc extends Bloc<ProfileEvents, EditProfileState> {
  final nameController = TextEditingController(text: CacheHelper.getName());

  final phoneController = TextEditingController(text: CacheHelper.getPhone());

  final cityController = TextEditingController(text: CacheHelper.getCityName());

  String cityId = CacheHelper.getCityId();
  File? selectedImage;
  final DioHelper dioHelper;

  EditProfileBloc(this.dioHelper) : super(EditProfileState()) {
    on<EditProfileEvent>(_updateProfile);
  }

  void _updateProfile(EditProfileEvent event,Emitter<EditProfileState> emit) async {
    emit(EditProfileLoadingState());
    final response = await dioHelper.post("client/profile", data: {
      "image": selectedImage == null
          ? null
          : MultipartFile.fromFileSync(selectedImage!.path,
              filename: selectedImage!.path.split("/").last),
      "fullname": nameController.text,
      "phone": phoneController.text,
      "city_id": cityId,
    });
    if (response.isSuccess) {
      emit(EditProfileSuccessState(msg: response.response!.data["message"]));
    } else {
      emit(EditProfileFailedState());
    }
  }
}
