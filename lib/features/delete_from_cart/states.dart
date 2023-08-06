part of 'bloc.dart';

class DeleteFromCartStates {}

class DeleteFromCartLoadingState extends DeleteFromCartStates {}

class DeleteFromCartSuccessState extends DeleteFromCartStates {
  final String msg;

  DeleteFromCartSuccessState({required this.msg}) {
    showMSG(message: msg);
  }
}

class DeleteFromCartFailedState extends DeleteFromCartStates {
  final String msg;

  DeleteFromCartFailedState({required this.msg}) {
    showMSG(message: msg);
  }
}
