part of 'bloc.dart';

class LoginStates {}
class LoginLoadingStates extends LoginStates {}
class LoginSuccessStates extends LoginStates{
  final String msg;

  LoginSuccessStates({required this.msg}){
    showMSG(
        message: msg == ""
            ? "تم تسجيل الدخول بنجاح"
            : msg);
  }
}
class LoginFailedStates extends LoginStates{
  final String msg;

  LoginFailedStates({required this.msg}){
    showMSG(message: msg);
  }
}
