import 'model.dart';

class GetFavStates {}

class GetFavLoadingState extends GetFavStates {}

class GetFavSuccessState extends GetFavStates {
 final List<FavProductData> list;

  GetFavSuccessState({required this.list});
}

class GetFavFailedState extends GetFavStates {}
