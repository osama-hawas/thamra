part of 'bloc.dart';

class AddAddressStates {}

class AddAddressLoadingState extends AddAddressStates {}

class AddAddressSuccessState extends AddAddressStates {
  final String msg;

  AddAddressSuccessState({required this.msg}) {
    showMSG(message: msg);
  }
}

class AddAddressFailedState extends AddAddressStates {
  final String msg;

  AddAddressFailedState({required this.msg}) {
    showMSG(message: msg);
  }
}
