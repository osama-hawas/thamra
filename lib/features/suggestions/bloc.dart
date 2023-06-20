import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/features/suggestions/states.dart';

import '../../core/data/service/dio_helper.dart';
import 'events.dart';

class SuggestionBloc extends Bloc<SuggestionEvents, SuggestionStates> {
  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final titleController = TextEditingController();

  final contentController = TextEditingController();
  final DioHelper dioHelper;

  SuggestionBloc(this.dioHelper) : super(SuggestionStates()) {
    on<MakeSuggestionEvent>(_makeSuggestion);
  }

  void _makeSuggestion(
      SuggestionEvents events, Emitter<SuggestionStates> emit) async {
    emit(SuggestionLoadingState());
    final response = await dioHelper.post("contact", data: {
      "fullname": nameController.text,
      "phone": phoneController.text,
      "title": titleController.text,
      "content": contentController.text,
    });
    if (response.isSuccess) {
      emit(SuggestionSuccessState(msg: response.message));

    }  else
      {
      emit(SuggestionFailedState(msg: response.message));
      }
  }
}
