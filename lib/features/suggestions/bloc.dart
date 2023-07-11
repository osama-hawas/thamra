import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
part 'events.dart';
part 'states.dart';

class CreateContactBloc extends Bloc<CreateContactEvents, ContactStates> {
  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final titleController = TextEditingController();

  final contentController = TextEditingController();
  final DioHelper dioHelper;

  CreateContactBloc(this.dioHelper) : super(ContactStates()) {
    on<MakeContactEvent>(_makeContact);
  }

  void _makeContact(
      MakeContactEvent events, Emitter<ContactStates> emit) async {
    emit(CreateContactLoadingState());
    final response = await dioHelper.post("contact", data: {
      "fullname": nameController.text,
      "phone": phoneController.text,
      "title": titleController.text,
      "content": contentController.text,
    });
    if (response.isSuccess) {
      emit(CreateContactSuccessState(msg: response.message));

    }  else
      {
      emit(CreateContactFailedState(msg: response.message));
      }
  }
}
