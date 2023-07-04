import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/features/fav/model.dart';

import '../../core/data/service/dio_helper.dart';
import 'events.dart';
import 'states.dart';

class GetFavBloc extends Bloc<FavProductEvents, GetFavStates> {
  final DioHelper dioHelper;

  GetFavBloc(this.dioHelper) : super(GetFavStates()) {
    on<GetFavProductEvents>(_getFavProduct);
  }

  void _getFavProduct(
      GetFavProductEvents event, Emitter<GetFavStates> emit) async {
    emit(GetFavLoadingState());
    final response = await dioHelper.get("client/products/favorites");
    if (response.isSuccess) {
     final  getFavData =
          FavProductModel.fromJson(response.response!.data).favProductData;
      emit(GetFavSuccessState(list: getFavData));
    } else {
      emit(GetFavFailedState());
    }
  }
}
