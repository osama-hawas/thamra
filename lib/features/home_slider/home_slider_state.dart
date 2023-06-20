import 'model.dart';

class HomeSliderState {}

class HomeSliderLoadingState extends HomeSliderState {}

class HomeSliderSuccessState extends HomeSliderState {
 final List<ImageModel> list;

  HomeSliderSuccessState({required this.list});
}

class HomeSliderFailedState extends HomeSliderState {}
