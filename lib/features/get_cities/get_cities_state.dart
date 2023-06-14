part of 'get_cities_cubit.dart';

class GetCitiesState {}

class GetCitiesLoadingState extends GetCitiesState{}

class GetCitiesSuccessState extends GetCitiesState{
  List<CityModel> list;
  GetCitiesSuccessState({required this.list});
}

class GetCitiesFailedState extends GetCitiesState{}
