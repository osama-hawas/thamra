import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/core/data/service/dio_helper.dart';
import 'package:thamra/features/get_cities/cities_event.dart';
import 'package:thamra/features/get_cities/model.dart';

part 'get_cities_state.dart';

class GetCitiesCubit extends Bloc<CitiesEvent, GetCitiesState> {
  GetCitiesCubit() : super(GetCitiesState()) {
    on<GetCitiesEvent>(_getCities);
  }

  void _getCities(GetCitiesEvent event, Emitter<GetCitiesState> emit) async {
    emit(GetCitiesLoadingState());
    final response = await DioHelper.get("cities/1");
    if (response.isSuccess) {
      final list = await CityData.fromJson(response.response!.data).cityModel;
      emit(GetCitiesSuccessState(list: list));
    } else {
      emit(GetCitiesFailedState());
    }
  }
}
