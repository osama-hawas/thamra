part of 'bloc.dart';

class ConfirmPassCodeState {}

class ConfirmPassCodeLoadingState extends ConfirmPassCodeState {}

class ConfirmPassCodeSuccessState extends ConfirmPassCodeState {}

class ConfirmPassCodeFailedState extends ConfirmPassCodeState {
  ConfirmPassCodeFailedState() {
    showMSG(message: "الكود غير صحيح");
  }
}
