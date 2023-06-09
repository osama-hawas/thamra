part of 'bloc.dart';
class ConfirmNewPassState {}

class ConfirmNewPassLoadingState extends ConfirmNewPassState {}
class ConfirmNewPassSuccessState extends ConfirmNewPassState {
 final String msg;

  ConfirmNewPassSuccessState({required this.msg}){
    showMSG(message: msg);
  }
}
class ConfirmNewPassFailedState extends ConfirmNewPassState {
  final String msg;

  ConfirmNewPassFailedState({required this.msg}){
    showMSG(message: msg);
  }
}
