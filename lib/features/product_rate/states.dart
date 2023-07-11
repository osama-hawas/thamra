part of 'bloc.dart';

class GetProductRateStates {}

class GetProductRateLoadingStates extends GetProductRateStates {}

class GetProductRateSuccessStates extends GetProductRateStates {
  final List<ProductRateData> list;

  GetProductRateSuccessStates({required this.list});
}

class GetProductRateFailedStates extends GetProductRateStates {}
