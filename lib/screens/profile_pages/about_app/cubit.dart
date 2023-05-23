import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/screens/profile_pages/about_app/states.dart';

class AboutAppCubit extends Cubit<AboutAppStates> {
  AboutAppCubit() : super(AboutAppStates());
  var data;

  Future<void> getPolicies() async {
    emit(AboutApploadingState());
    try {
      Response response =
          await Dio().get('https://thimar.amr.aait-d.com/api/about');
      data = response.data['data']['about'];
      emit(AboutAppsuccessState());
    } catch (ex) {
      emit(AboutAppfailedState());
    }
  }
}
