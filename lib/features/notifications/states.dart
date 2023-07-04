
import 'model.dart';

class GetNotificationsStates {}

class GetNotificationsLoadingStates extends GetNotificationsStates {}

class GetNotificationsSuccessStates extends GetNotificationsStates {
  final List<Notifications> list;

  GetNotificationsSuccessStates({required this.list});
}

class GetNotificationsFialedStates extends GetNotificationsStates {}
