import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';

part 'events.dart';

part 'states.dart';

class CancelOrderBloc extends Bloc<CancelOrderEvents, CancelOrderStates> {
  late int id;
  final DioHelper dioHelper;

  CancelOrderBloc(this.dioHelper) : super(CancelOrderStates()) {
    on<CancelOrderEvent>(_addToCart);
  }

  void _addToCart(
      CancelOrderEvent event, Emitter<CancelOrderStates> emit) async {
    emit(CancelOrderLoadingState());
    final response = await dioHelper.post("client/orders/$id/cancel");
    if (response.isSuccess) {
      emit(CancelOrderSuccessState(msg: response.message));
    } else {
      emit(CancelOrderFailedState(msg: response.message));
    }
  }
}
