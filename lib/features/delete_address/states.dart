part of 'bloc.dart';

class DeleteAddressesStates {}

class DeleteAddressesLoadingState extends DeleteAddressesStates {

}

class DeleteAddressesSuccessState extends DeleteAddressesStates {
  final String msg;

  DeleteAddressesSuccessState({required this.msg}){
    showMSG(message:msg);
  }

}

class DeleteAddressesFailedState extends DeleteAddressesStates {
  final String msg;

  DeleteAddressesFailedState({required this.msg}){
    showMSG(message:msg);

  }

}
