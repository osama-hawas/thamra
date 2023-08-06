part of 'bloc.dart';

class GetFavStates {}

class GetFavLoadingState extends GetFavStates {}

class GetFavSuccessState extends GetFavStates {
 final List<ProductData> list;

  GetFavSuccessState({required this.list});
}

class GetFavFailedState extends GetFavStates {}
