
part of 'bloc.dart';

class GetCatigoryProductStates {}

class GetCatigoryProductLoadingState extends GetCatigoryProductStates {}

class GetCatigoryProductSuccessState extends GetCatigoryProductStates {
  final List<ProductData> list;

  GetCatigoryProductSuccessState({required this.list});
}

class GetCatigoryProductFailedState extends GetCatigoryProductStates {}
