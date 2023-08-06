import 'package:bloc/bloc.dart';

import '../../core/logic/dio_helper.dart';
part  'events.dart';
part  'states.dart';
part  'model.dart';


class ShowCartBloc extends Bloc<ShowCartEvents, ShowCartStates> {
  final DioHelper dioHelper;

  ShowCartBloc(this.dioHelper) : super(ShowCartStates()) {
    on<ShowCartEvent>(_get);
  }

  void _get(
      ShowCartEvents event, Emitter<ShowCartStates> emit) async {
    emit(ShowCartLoadingState());
    final response = await dioHelper.get("client/cart");
    if (response.isSuccess) {
      final cartModel =
          CartModel.fromJson(response.response!.data);
      emit(ShowCartSuccessState(cartModel: cartModel));
    } else {
      emit(ShowCartFailedState());
    }
  }
}
