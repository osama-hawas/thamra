import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/core/logic/dio_helper.dart';


part 'states.dart';
part 'events.dart';
part 'model.dart';

class GetCitiesBloc extends Bloc<CitiesEvents, GetCitiesStates> {
  final DioHelper dioHelper;

  GetCitiesBloc(this.dioHelper) : super(GetCitiesStates()) {
    on<GetCitiesEvent>(_getCities);
  }

  void _getCities(GetCitiesEvent event, Emitter<GetCitiesStates> emit) async {
    emit(GetCitiesLoadingState());
    final response = await dioHelper.get("cities/1");
    if (response.isSuccess) {
      final list = CityData.fromJson(response.response!.data).cityModel;
      emit(GetCitiesSuccessState(list: list));
    } else {
      emit(GetCitiesFailedState());
    }
  }
}
