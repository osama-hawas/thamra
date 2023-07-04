class OrdersEvents {}

class GetOrderEvent extends OrdersEvents {
  final String endPoint;

  GetOrderEvent({required this.endPoint});

}
