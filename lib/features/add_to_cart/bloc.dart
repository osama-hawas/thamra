import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
part 'events.dart';
part 'states.dart';

class AddToCartBloc extends Bloc<CartProductEvents, AddToCartStates> {
  late int productId;
  final DioHelper dioHelper;

  AddToCartBloc(this.dioHelper) : super(AddToCartStates()) {
    on<AddToCartEvent>(_addToCart);
  }

  void _addToCart(
      AddToCartEvent event, Emitter<AddToCartStates> emit) async {
    emit(AddToCartLoadingState());
    final response = await dioHelper.post("client/cart", data: {
      "product_id": productId,
      "amount": 1,
    });
    if (response.isSuccess) {
      emit(AddToCartSuccessState(msg: response.message));
    } else {
      emit(AddToCartFailedState(msg: response.message));
    }
  }
}
