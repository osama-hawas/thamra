import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thamra/features/notifications/states.dart';

import '../../core/data/service/dio_helper.dart';
import 'events.dart';
import 'model.dart';

class GetNotificationsBloc
    extends Bloc<NotificationsEvents, GetNotificationsStates> {
  final DioHelper dioHelper;

  GetNotificationsBloc(this.dioHelper) : super(GetNotificationsStates()) {
    on<GetNotificationsEvents>(_getFavProduct);
  }

  void _getFavProduct(GetNotificationsEvents event,
      Emitter<GetNotificationsStates> emit) async {
    emit(GetNotificationsLoadingStates());
    final response = await dioHelper.get("notifications/");
    if (response.isSuccess) {
      final getNotificationsData =
          NotificationModel.fromJson(response.response!.data)
              .data
              .notifications;

      emit(GetNotificationsSuccessStates(list: getNotificationsData));
    } else {
      emit(GetNotificationsFialedStates());
    }
  }
}
