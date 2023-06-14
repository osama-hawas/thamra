part of 'sign_up_cubit.dart';

class SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
 final String msg;

  SignUpSuccessState({required this.msg});
}

class SignUpFailedState extends SignUpState {
 final String msg;

 SignUpFailedState({required this.msg});
}
