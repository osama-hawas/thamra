import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/features/privacy/states.dart';

import '../../core/data/service/dio_helper.dart';
import 'events.dart';

class PrivacyBloc extends Bloc<PrivacyEvents, PrivacyStates> {
  final DioHelper dioHelper;

  PrivacyBloc(this.dioHelper) : super(PrivacyStates()) {
    on<GetPrivacyEvent>(_getPolicies);
  }

  var data;

  void _getPolicies(GetPrivacyEvent event, Emitter<PrivacyStates> emit) async {
    emit(PrivacyloadingState());
    try {
      final response = await dioHelper.get('policy');
      data = response.response!.data["data"]['policy'];
      emit(PrivacysuccessState());
    } catch (ex) {
      emit(PrivacyfailedState());
    }
  }
}
