import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class AboutAppBloc extends Bloc<AboutAppEvents, AboutAppStates> {
  final DioHelper dioHelper;

  AboutAppBloc(this.dioHelper) : super(AboutAppStates()) {
    on<GetAboutAppDataEvent>(_get);
  }

  var data;

  Future<void> _get(
      GetAboutAppDataEvent event, Emitter<AboutAppStates> emit) async {
    emit(AboutApploadingState());

    final response = await dioHelper.get('about');
    if (response.isSuccess) {
      data = response.response!.data['data']['about'];
      emit(AboutAppsuccessState());
    } else {
      emit(AboutAppfailedState());
    }
  }
}
