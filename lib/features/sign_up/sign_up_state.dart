part of 'sign_up_cubit.dart';

class SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
 final String msg;

  SignUpSuccessState({required this.msg});
}

class SignUpFailedState extends SignUpStates {
 final String msg;

 SignUpFailedState({required this.msg});
}
