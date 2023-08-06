part of 'bloc.dart';


class IsFavStates {}

class IsFavLoadingState extends IsFavStates {}
class IsFavSuccessState extends IsFavStates {
  final String msg ;

  IsFavSuccessState({required this.msg}){
    showMSG(message: msg);
  }
}
class IsFavFailedState extends IsFavStates {}