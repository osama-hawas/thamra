part of 'bloc.dart';

class ShowCartStates {}


class ShowCartLoadingState extends ShowCartStates {}

class ShowCartSuccessState extends ShowCartStates {
  final  CartModel cartModel;

  ShowCartSuccessState({required this.cartModel});
}

class ShowCartFailedState extends ShowCartStates {}
