import 'model.dart';

class GetCatigoryProductStates {}

class GetCatigoryProductLoadingState extends GetCatigoryProductStates {}

class GetCatigoryProductSuccessState extends GetCatigoryProductStates {
  final List<CatigoryProductData> list;

  GetCatigoryProductSuccessState({required this.list});
}

class GetCatigoryProductFailedState extends GetCatigoryProductStates {}
