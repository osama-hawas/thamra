class LoginStates {}
class LoginLoadingStates extends LoginStates {}
class LoginSuccessStates extends LoginStates{}
class LoginFailedStates extends LoginStates{
  final String msg;

  LoginFailedStates({required this.msg});
}
