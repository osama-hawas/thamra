import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/core/logic/dio_helper.dart';

import '../../core/logic/helper_methods.dart';


part 'states.dart';

part 'events.dart';

class UpdateCartAmountBloc
    extends Bloc<UpdateCartAmountEvents, UpdateCartAmountStates> {
  final DioHelper dioHelper;


  UpdateCartAmountBloc(this.dioHelper) : super(UpdateCartAmountStates()) {
    on<UpdateCartAmountEvent>(_event);
  }

  void _event(
      UpdateCartAmountEvent event, Emitter<UpdateCartAmountStates> emit) async {
    emit(UpdateCartAmountLoadingState());

    final response = await dioHelper.put("client/cart/${event.id}", data: {
      'amount': event.amount ,
    });
    print(response.response!.data);
    if (response.isSuccess) {
      emit(UpdateCartAmountSuccessState());

    } else {
      emit(UpdateCartAmountFailedState(msg:response.message ));

    }
  }
}
