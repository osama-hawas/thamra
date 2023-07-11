part of 'bloc.dart';

class ResendCodeStates {}

class ResendCodeLoadingState extends ResendCodeStates {}

class ResendCodeSuccessState extends ResendCodeStates {
  final String msg;

  ResendCodeSuccessState({required this.msg}){
    showMSG(message: msg);
  }
}

class ResendCodeFailedState extends ResendCodeStates {}
