part of 'bloc.dart';


 class EditPassState {}

class EditPassLoadingState extends EditPassState {}
class EditPassSuccessState extends EditPassState {
 final String msg ;

 EditPassSuccessState({required this.msg}){
   showMSG(message: msg);
  }
}
class EditPassFailedState extends EditPassState {
  final String msg ;

  EditPassFailedState({required this.msg}){
    showMSG(message: msg);
  }
}
