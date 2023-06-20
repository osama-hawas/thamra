class LoginStates {}
class LoginLoadingStates extends LoginStates {}
class LoginSuccessStates extends LoginStates{
  final String msg;

  LoginSuccessStates({required this.msg});
}
class LoginFailedStates extends LoginStates{
  final String msg;

  LoginFailedStates({required this.msg});
}
