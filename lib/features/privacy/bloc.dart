import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
part  'events.dart';
part  'states.dart';


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
