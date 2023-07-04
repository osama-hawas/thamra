import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/core/data/service/dio_helper.dart';
import 'package:thamra/features/get_cities/events.dart';
import 'package:thamra/features/get_cities/model.dart';

part 'states.dart';

class GetCitiesBloc extends Bloc<CitiesEvents, GetCitiesStates> {
  final DioHelper dioHelper;

  GetCitiesBloc(this.dioHelper) : super(GetCitiesStates()) {
    on<GetCitiesEvent>(_getCities);
  }

  void _getCities(GetCitiesEvent event, Emitter<GetCitiesStates> emit) async {
    emit(GetCitiesLoadingState());
    final response = await dioHelper.get("cities/1");
    if (response.isSuccess) {
      final list = await CityData.fromJson(response.response!.data).cityModel;
      emit(GetCitiesSuccessState(list: list));
    } else {
      emit(GetCitiesFailedState());
    }
  }
}
