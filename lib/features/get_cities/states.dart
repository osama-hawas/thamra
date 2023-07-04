part of 'bloc.dart';

class GetCitiesStates {}

class GetCitiesLoadingState extends GetCitiesStates{}

class GetCitiesSuccessState extends GetCitiesStates{
  List<CityModel> list;
  GetCitiesSuccessState({required this.list});
}

class GetCitiesFailedState extends GetCitiesStates{}
