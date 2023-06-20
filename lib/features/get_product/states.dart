 import 'package:thamra/features/get_product/model.dart';

class GetProductsState {}


 class GetProductsLoadingState extends GetProductsState {}

 class GetProductsSuccessState extends GetProductsState {
   final  List<ProductData> list;

   GetProductsSuccessState({required this.list});
 }

 class GetProductsFailedState extends GetProductsState {}
