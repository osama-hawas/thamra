part of 'bloc.dart';

class GetProductsState {}


 class GetProductsLoadingState extends GetProductsState {}

 class GetProductsSuccessState extends GetProductsState {
   final  List<ProductData> list;

   GetProductsSuccessState({required this.list});
 }

 class GetProductsFailedState extends GetProductsState {}
