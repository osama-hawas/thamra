class AddToCartStates {}

class AddToCartLoadingState extends AddToCartStates {}

class AddToCartSuccessState extends AddToCartStates {
  final String msg;

  AddToCartSuccessState({required this.msg});
}

class AddToCartFailedState extends AddToCartStates {
  final String msg;

  AddToCartFailedState({required this.msg});
}
