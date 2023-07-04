
import 'package:bloc/bloc.dart';
import 'package:thamra/core/data/service/dio_helper.dart';
import 'package:thamra/features/home_slider/model.dart';

import 'events.dart';
import 'states.dart';

class HomeSliderBloc extends Bloc<HomeSliderEvent, HomeSliderStates> {
  final DioHelper dioHelper;
  var data;

  HomeSliderBloc(this.dioHelper) : super(HomeSliderStates()) {
    on<HomeSliderEvent>(_getSliderImg);
  }

  void _getSliderImg(
      HomeSliderEvent event, Emitter<HomeSliderStates> emit) async {
    emit(HomeSliderLoadingState());
    final response = await dioHelper.get("sliders");
    if (response.isSuccess) {

      final list = ImageSliderModel.fromJson(response.response!.data).data;
      data=list;
      emit(HomeSliderSuccessState(list: list));
    } else {
      emit(HomeSliderFailedState());
    }
  }
}
