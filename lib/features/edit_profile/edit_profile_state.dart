part of 'edit_profile_cubit.dart';


 class EditProfileState {}

class EditProfileLoadingState extends EditProfileState {}
class EditProfileSuccessState extends EditProfileState {
 final String msg ;

  EditProfileSuccessState({required this.msg});
}
class EditProfileFailedState extends EditProfileState {}
