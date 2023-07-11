part of 'bloc.dart';

class NotificationModel {
  late final Data data;

  late final String status;
  late final String message;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);

    status = json['status'];
    message = json['message'];
  }
}

class Data {
  late final int unreadnotificationsCount;
  late final List<Notifications> notifications;

  Data.fromJson(Map<String, dynamic> json) {
    unreadnotificationsCount = json['unreadnotifications_count'];
    notifications = List.from(json['notifications'])
        .map((e) => Notifications.fromJson(e))
        .toList();
  }
}

class Notifications {
  late final String id;
  late final String title;
  late final String body;
  late final String notifyType;
  late final Order order;
  late final void offer;
  late final void chat;
  late final String createdAt;
  late final String readAt;
  late final String image;

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    notifyType = json['notify_type'];
    order = Order.fromJson(json['order']);
    offer = null;
    chat = null;
    createdAt = json['created_at'];
    readAt = json['read_at'];
    image = json['image'];
  }
}

class Order {
  late final int orderId;
  late final int clientId;
  late final int driverId;
  late final void orderType;
  late final String orderStatus;

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    clientId = json['client_id'];
    driverId = json['driver_id'];
    orderType = null;
    orderStatus = json['order_status'];
  }
}
