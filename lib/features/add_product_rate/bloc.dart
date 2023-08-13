import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';

part 'events.dart';

part 'states.dart';

class AddProductRateBloc
    extends Bloc<AddProductRateEvents, AddProductRateStates> {
  late int productId;
  late int value;
  final commitController = TextEditingController();
  final DioHelper dioHelper;

  AddProductRateBloc(this.dioHelper) : super(AddProductRateStates()) {
    on<AddProductRateEvent>(_addToCart);
  }

  void _addToCart(
      AddProductRateEvent event, Emitter<AddProductRateStates> emit) async {
    emit(AddProductRateLoadingState());
    final response =
        await dioHelper.post("client/products/$productId/rate", data: {
      "value": value,
      "comment": commitController.text,
    });
    if (response.isSuccess) {
      emit(AddProductRateSuccessState(msg: response.message));
    } else {
      emit(AddProductRateFailedState(msg: response.message));
    }
  }
}
