part of 'bloc.dart';

class UpdateCartAmountStates {}

class UpdateCartAmountLoadingState extends UpdateCartAmountStates {}

class UpdateCartAmountSuccessState extends UpdateCartAmountStates {
  // final String msg;
  //
  // UpdateCartAmountSuccessState({required this.msg}) {
  //   showMSG(message: msg);
  // }
}

class UpdateCartAmountFailedState extends UpdateCartAmountStates {
  final String msg;

  UpdateCartAmountFailedState({required this.msg}) {
    showMSG(message: msg);
  }
}
