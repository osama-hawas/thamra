import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data/service/dio_helper.dart';
import 'events.dart';
import 'model.dart';
import 'states.dart';

class CategoriesBloc extends Bloc<CategoriesEvents, CategoriesStates> {
  final DioHelper dioHelper;
  var data;

  CategoriesBloc(this.dioHelper) : super(CategoriesStates()) {
    on<GetCategoriesEvent>(_getCategories);
  }

  void _getCategories(
      GetCategoriesEvent event, Emitter<CategoriesStates> emit) async {
    emit(CategoriesLoadingState());
    final response = await dioHelper.get("categories");
    if (response.isSuccess) {
      final catgoryData =
          CategoriesModel.fromJson(response.response!.data).categoryData;
      data=catgoryData;
      emit(CategoriesSuccessState(list: catgoryData));
    } else {
      emit(CategoriesFailedState());
    }
  }
}
