import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
part  'events.dart';
part  'states.dart';
part  'model.dart';


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
