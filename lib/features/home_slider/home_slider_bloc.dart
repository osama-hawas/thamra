import 'package:bloc/bloc.dart';
import 'package:thamra/core/data/service/dio_helper.dart';
import 'package:thamra/features/home_slider/model.dart';

import 'home_slider_event.dart';
import 'home_slider_state.dart';

class HomeSliderBloc extends Bloc<HomeSliderEvent, HomeSliderState> {
  final DioHelper dioHelper;

  HomeSliderBloc(this.dioHelper) : super(HomeSliderState()) {
    on<HomeSliderEvent>(_getSliderImg);
  }

  void _getSliderImg(
      HomeSliderEvent event, Emitter<HomeSliderState> emit) async {
    emit(HomeSliderLoadingState());
    final response = await dioHelper.get("sliders");
    if (response.isSuccess) {
      final list = ImageSliderModel.fromJson(response.response!.data).data;
      emit(HomeSliderSuccessState(list: list));
    } else {
      emit(HomeSliderFailedState());
    }
  }
}
