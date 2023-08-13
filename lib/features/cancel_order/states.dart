part of 'bloc.dart';

class CancelOrderStates {}

class CancelOrderLoadingState extends CancelOrderStates {}

class CancelOrderSuccessState extends CancelOrderStates {
  final String msg;

  CancelOrderSuccessState({required this.msg}) {
    showMSG(message: msg);
  }
}

class CancelOrderFailedState extends CancelOrderStates {
  final String msg;

  CancelOrderFailedState({required this.msg}) {
    showMSG(message: msg);
  }
}
