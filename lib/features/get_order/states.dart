


import 'model.dart';

class GetOrderStates {}

class GetOrderLoadingStates extends GetOrderStates {}

class GetOrderSuccessStates extends GetOrderStates {
  final List<OrderData> list;

  GetOrderSuccessStates({required this.list});
}

class GetOrderFailedStates extends GetOrderStates {}
