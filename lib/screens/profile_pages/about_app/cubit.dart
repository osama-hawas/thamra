import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/core/data/service/dio_helper.dart';
import 'package:thamra/screens/profile_pages/about_app/states.dart';

class AboutAppCubit extends Cubit<AboutAppStates> {
  AboutAppCubit() : super(AboutAppStates());
  var data;

  Future<void> getPolicies() async {
    emit(AboutApploadingState());
    try {
      final response =
          await DioHelper.get('about');
      data = response.response!.data['data']['about'];
      emit(AboutAppsuccessState());
    } catch (ex) {
      emit(AboutAppfailedState());
    }
  }
}
