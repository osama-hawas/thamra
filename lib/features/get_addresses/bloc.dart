import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/core/data/service/dio_helper.dart';

import 'events.dart';
import 'model.dart';

part 'states.dart';

class GetAddressesBloc extends Bloc<AddressesEvents, GetAddressesStates> {
  final DioHelper dioHelper;
late List<AddressData>list ;
  GetAddressesBloc(this.dioHelper) : super(GetAddressesStates()) {
    on<GetAddressesEvent>(_getAddresses);
  }

  void _getAddresses(
      GetAddressesEvent event, Emitter<GetAddressesStates> emit) async {

    emit(GetAddressesLoadingState());
    final response = await dioHelper.get("client/addresses");
    if (response.isSuccess) {
      list =
          await AddressesModel.fromJson(response.response!.data).addressData;
      emit(GetAddressesSuccessState(list: list));
    } else {
      emit(GetAddressesFailedState());
    }
  }
}
