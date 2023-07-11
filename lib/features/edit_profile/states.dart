part of 'bloc.dart';


 class EditProfileState {}

class EditProfileLoadingState extends EditProfileState {}
class EditProfileSuccessState extends EditProfileState {
 final String msg ;

  EditProfileSuccessState({required this.msg}){
   showMSG(message: msg);
  }
}
class EditProfileFailedState extends EditProfileState {}
