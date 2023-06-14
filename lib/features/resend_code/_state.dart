
class ResendCodeState {}

class ResendCodeLoadingState extends ResendCodeState {}

class ResendCodeSuccessState extends ResendCodeState {
  final String msg;

  ResendCodeSuccessState({required this.msg});
}

class ResendCodeFailedState extends ResendCodeState {}
