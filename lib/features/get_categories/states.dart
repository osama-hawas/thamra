part of 'bloc.dart';

class CategoriesStates {}

class CategoriesLoadingState extends CategoriesStates {}

class CategoriesSuccessState extends CategoriesStates {
final  List<CategoryData> list;

  CategoriesSuccessState({required this.list});
}

class CategoriesFailedState extends CategoriesStates {}
