
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';

part 'events.dart';

part 'states.dart';

part 'model.dart';

class ShowCartBloc extends Bloc<ShowCartEvents, ShowCartStates> {
  final DioHelper dioHelper;
  late CartModel cartModel;

  ShowCartBloc(this.dioHelper) : super(ShowCartStates()) {
    on<ShowCartEvent>(_get);
  }

  void _get(ShowCartEvent event, Emitter<ShowCartStates> emit) async {
    if (event.isOutLoading) {
      emit(ShowCartOutLoadingState());
    } else {
      emit(ShowCartLoadingState());
    }
    final response = await dioHelper.get("client/cart");
    if (response.isSuccess) {
      cartModel = CartModel.fromJson(response.response!.data);
      emit(ShowCartSuccessState());
    } else {
      emit(ShowCartFailedState());
    }
  }
}
