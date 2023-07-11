part of 'bloc.dart';

class ContactStates {}

class CreateContactLoadingState extends ContactStates {}

class CreateContactSuccessState extends ContactStates {
  final String msg ;

  CreateContactSuccessState({required this.msg}){
    showMSG(message: msg);

  }
}

class CreateContactFailedState extends ContactStates {
  final String msg ;

  CreateContactFailedState({required this.msg}){
    showMSG(message: msg);

  }

}
