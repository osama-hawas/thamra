import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
part 'events.dart';
part 'states.dart';
part 'model.dart';


class GetContactBloc extends Bloc<ContactEvents, GetContactStates> {
  final DioHelper dioHelper;

  GetContactBloc(this.dioHelper) : super(GetContactStates()) {
    on<GetContactEvent>(_getContact);
  }

  void _getContact(
      GetContactEvent event, Emitter<GetContactStates> emit) async {
    emit(GetContactLoadingState());
    final response = await dioHelper.get("contact");
    if (response.isSuccess) {
      final data = ContactModel.fromJson(response.response!.data).data;
      emit(GetContactSuccessState(data: data));
    } else {
      emit(GetContactFailedState());
    }
  }
}
