import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/screens/profile_pages/privacy/states.dart';

class PrivacyCubit extends Cubit<PrivacyStates> {
  PrivacyCubit() : super(PrivacyStates());
  var data;

  Future<void> getPolicies() async {
    emit(PrivacyloadingState());
    try {
      Response response =
          await Dio().get('https://thimar.amr.aait-d.com/api/policy');
      data = response.data['data']['policy'];
      emit(PrivacysuccessState());
    } catch (ex) {
      emit(PrivacyfailedState());
    }
  }
}
