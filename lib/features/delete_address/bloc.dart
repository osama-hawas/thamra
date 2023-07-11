
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
part  'events.dart';
part  'states.dart';


class DeleteAddressesBloc
    extends Bloc<DAddressesEvents, DeleteAddressesStates> {
  final DioHelper dioHelper;
  late int id ;

  DeleteAddressesBloc(this.dioHelper) : super(DeleteAddressesStates()) {
    on<DeleteAddressesEvent>(_deleteAddresses);
  }

  void _deleteAddresses(
      DeleteAddressesEvent event, Emitter<DeleteAddressesStates> emit) async {
    emit(DeleteAddressesLoadingState());
    final response =
        await dioHelper.delete("client/addresses/$id");
    if (response.isSuccess) {
      emit(DeleteAddressesSuccessState(msg: response.message));
    } else {
      emit(DeleteAddressesFailedState(msg: response.message));
    }
  }
}
