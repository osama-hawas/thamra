part of 'bloc.dart';

class HomeSliderStates {}

class HomeSliderLoadingState extends HomeSliderStates {}

class HomeSliderSuccessState extends HomeSliderStates {
 final List<ImageModel> list;

  HomeSliderSuccessState({required this.list});
}

class HomeSliderFailedState extends HomeSliderStates {}
