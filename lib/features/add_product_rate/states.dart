part of 'bloc.dart';



class AddProductRateStates {}

class AddProductRateLoadingState extends AddProductRateStates {}

class AddProductRateSuccessState extends AddProductRateStates {
  final String msg;

  AddProductRateSuccessState({required this.msg}){
    showMSG(message: msg);

  }
}

class AddProductRateFailedState extends AddProductRateStates {
  final String msg;

  AddProductRateFailedState({required this.msg}){
    showMSG(message: msg);

  }
}
