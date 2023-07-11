import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
part  'events.dart';
part  'states.dart';
part  'model.dart';


class GetCatigoryProductBloc
    extends Bloc<CatigoryProductEvents, GetCatigoryProductStates> {
  final DioHelper dioHelper;

  GetCatigoryProductBloc(this.dioHelper) : super(GetCatigoryProductStates()) {
    on<GetCatigoryProductEvent>(_getCatigoryProduct);
  }

  void _getCatigoryProduct(GetCatigoryProductEvent event,
      Emitter<GetCatigoryProductStates> emit) async {
    emit(GetCatigoryProductLoadingState());
    final response = await dioHelper.get("categories/${event.id}");
    if (response.isSuccess) {
      final getCatigoryProduct =
          CatigoryProductModel.fromJson(response.response!.data).data;
      emit(GetCatigoryProductSuccessState(list: getCatigoryProduct));
    } else {
      emit(GetCatigoryProductFailedState());
    }
  }
}
