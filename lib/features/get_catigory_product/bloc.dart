import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/features/get_catigory_product/states.dart';

import '../../core/data/service/dio_helper.dart';
import '../fav/events.dart';
import 'events.dart';
import 'model.dart';

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
