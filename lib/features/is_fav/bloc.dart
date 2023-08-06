
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/core/logic/dio_helper.dart';

import '../../core/logic/helper_methods.dart';

part 'states.dart';

part 'events.dart';

class IsFavBloc extends Bloc<IsFavEvents, IsFavStates> {
  final DioHelper dioHelper;
  int? id;
  String? endPoint;

  IsFavBloc(this.dioHelper) : super(IsFavStates()) {
    on<IsFavEvent>(_event);
  }

  void _event(IsFavEvent event, Emitter<IsFavStates> emit) async {
    emit(IsFavLoadingState());
    final response = await dioHelper.post("client/products/$id/$endPoint");
    if (response.isSuccess) {
      emit(IsFavSuccessState(msg: response.response!.data["message"]));
    } else {
      emit(IsFavFailedState());
    }
  }
}
