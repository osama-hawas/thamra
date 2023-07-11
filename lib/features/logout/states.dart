part of 'bloc.dart';

class LogoutStates {}

class LogoutLoadingState extends LogoutStates {}

class LogoutSuccessState extends LogoutStates {
  final String msg;

  LogoutSuccessState({required this.msg}){
    showMSG(message: msg);
  }
}

class LogoutFailedState extends LogoutStates {
  final String msg;

  LogoutFailedState({required this.msg}){
    showMSG(message: msg);
  }
}
