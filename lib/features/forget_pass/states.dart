part of 'bloc.dart';

class ForgetPassState {}

class ForgetPassLoadingState extends ForgetPassState {}

class ForgetPassSuccessState extends ForgetPassState {
  final String msg;

  ForgetPassSuccessState({required this.msg}){
    showMSG(message: msg);
  }
}

class ForgetPassFailedState extends ForgetPassState {
  final String msg;

  ForgetPassFailedState({required this.msg}){
    showMSG(message: msg);
  }
}
