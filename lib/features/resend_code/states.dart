
class ResendCodeStates {}

class ResendCodeLoadingState extends ResendCodeStates {}

class ResendCodeSuccessState extends ResendCodeStates {
  final String msg;

  ResendCodeSuccessState({required this.msg});
}

class ResendCodeFailedState extends ResendCodeStates {}
