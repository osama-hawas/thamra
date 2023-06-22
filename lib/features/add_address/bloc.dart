import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/features/add_address/states.dart';

import '../../core/data/service/dio_helper.dart';
import 'events.dart';

class AddAddressBloc extends Bloc<AddressEvents, AddAddressStates> {
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final descController = TextEditingController();
  String? lat;
 String ?lng;
   String? tpye;
  final DioHelper dioHelper;

  AddAddressBloc(this.dioHelper) : super(AddAddressStates()) {
    on<AddAddressEvent>(_addAddress);
  }

  void _addAddress(
      AddAddressEvent event, Emitter<AddAddressStates> emit) async {
    emit(AddAddressLoadingState());
    final response = await dioHelper.post("client/addresses", data: {
      "type": tpye,
      "phone": phoneController.text,
      "description": descController.text,
      "location": locationController.text,
      "lat": lat,
      "lng": lng,
      "is_default": "1",
    });
    if (response.isSuccess) {
      emit(AddAddressSuccessState(msg: response.message));
    } else {
      emit(AddAddressFailedState(msg: response.message));
    }
  }
}
