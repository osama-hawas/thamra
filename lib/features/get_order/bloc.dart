import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
part  'states.dart';
part  'events.dart';
part  'model.dart';



class GetOrdersBloc extends Bloc<OrdersEvents, GetOrderStates> {
  final DioHelper dioHelper;
  final String endPoint ="current" ;


  GetOrdersBloc(
    this.dioHelper,
  ) : super(GetOrderStates()) {
    on<GetOrderEvent>(_getFavProduct);
  }

  void _getFavProduct(GetOrderEvent event, Emitter<GetOrderStates> emit) async {
    emit(GetOrderLoadingStates());
    final response =
        await dioHelper.get("client/orders/${event.endPoint}");
    if (response.isSuccess) {
      final getCurrentOrderData =
          OrderModel.fromJson(response.response!.data).data;

      emit(GetOrderSuccessStates(list: getCurrentOrderData));
    } else {
      emit(GetOrderFailedStates());
    }
  }
}
