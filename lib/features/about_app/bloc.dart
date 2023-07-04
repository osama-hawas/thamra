import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data/service/dio_helper.dart';
import 'events.dart';
import 'states.dart';

class AboutAppBloc extends Bloc<AboutAppEvents, AboutAppStates> {
  final DioHelper dioHelper;

  AboutAppBloc(this.dioHelper) : super(AboutAppStates()) {
    on<GetAboutAppDataEvent>(_getData);
  }

  var data;

  Future<void> _getData(
      GetAboutAppDataEvent event, Emitter<AboutAppStates> emit) async {
    emit(AboutApploadingState());
    try {
      final response = await dioHelper.get('about');
      data = response.response!.data['data']['about'];
      emit(AboutAppsuccessState());
    } catch (ex) {
      emit(AboutAppfailedState());
    }
  }
}
