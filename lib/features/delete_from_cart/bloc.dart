import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';

part 'events.dart';

part 'states.dart';

class DeleteFromCartBloc
    extends Bloc<DeleteFromCartEvents, DeleteFromCartStates> {
  final DioHelper dioHelper;

  DeleteFromCartBloc(this.dioHelper) : super(DeleteFromCartStates()) {
    on<DeleteFromCartEvent>(_delete);
  }

  void _delete(
      DeleteFromCartEvent event, Emitter<DeleteFromCartStates> emit) async {
    emit(DeleteFromCartLoadingState());
    final response = await dioHelper.delete("client/cart/delete_item/${event.id}");
    if (response.isSuccess) {
      emit(DeleteFromCartSuccessState(msg: response.message));
    } else {
      emit(DeleteFromCartFailedState(msg: response.message));
    }
  }
}
