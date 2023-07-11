import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/core/logic/dio_helper.dart';



part 'states.dart';
part 'model.dart';
part 'events.dart';

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
          AddressesModel.fromJson(response.response!.data).addressData;
      emit(GetAddressesSuccessState(list: list));
    } else {
      emit(GetAddressesFailedState());
    }
  }
}
