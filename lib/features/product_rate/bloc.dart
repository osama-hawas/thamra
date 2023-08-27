
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
part 'events.dart';
part 'model.dart';
part 'states.dart';



class GetProductRateBloc extends Bloc<ProductRateEvents, GetProductRateStates> {
  final DioHelper dioHelper;

  GetProductRateBloc(this.dioHelper) : super(GetProductRateStates()) {
    on<GetProductRateEvent>(_getProductRate);
  }

  void _getProductRate(
      GetProductRateEvent event, Emitter<GetProductRateStates> emit) async {
    emit(GetProductRateLoadingStates());
    final response = await dioHelper.get("products/2/rates");
    if (response.isSuccess) {
      final pruductRateDate =
          ProductRateModel.fromJson(response.response!.data).data;
      emit(GetProductRateSuccessStates(list: pruductRateDate));
    } else {
      emit(GetProductRateFailedStates());
    }
  }
}