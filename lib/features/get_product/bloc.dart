import 'package:bloc/bloc.dart';

import '../../core/logic/dio_helper.dart';
part  'events.dart';
part  'states.dart';
part  'model.dart';


class GetProductsBloc extends Bloc<ProductsEvents, GetProductsState> {
  final DioHelper dioHelper;

  GetProductsBloc(this.dioHelper) : super(GetProductsState()) {
    on<GetProductEvent>(_getProducts);
  }

  void _getProducts(
      GetProductEvent event, Emitter<GetProductsState> emit) async {
    emit(GetProductsLoadingState());
    final response = await dioHelper.get("products");
    if (response.isSuccess) {
      final PruductDate =
          ProductsModel.fromJson(response.response!.data).productData;
      emit(GetProductsSuccessState(list: PruductDate));
    } else {
      emit(GetProductsFailedState());
    }
  }
}
