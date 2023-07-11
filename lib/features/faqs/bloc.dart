import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
part 'events.dart';
part 'states.dart';
part 'model.dart';


class FAQsBloc extends Bloc<FAQsEvents, FAQsStates> {
  final DioHelper dioHelper;

  FAQsBloc(this.dioHelper) : super(FAQsStates()) {
    on<GetFAQsEvent>(_getFAQs);
  }

  var data;

  Future<void> _getFAQs(GetFAQsEvent event, Emitter<FAQsStates> emit) async {
    emit(FAQsloadingState());

    final response = await dioHelper.get('faqs');
    if (response.isSuccess) {
      final list = FAQsModel.fromJson(response.response!.data).data;
      emit(FAQssuccessState(list: list));
    }else{ emit(FAQsfailedState());}


  }
}
