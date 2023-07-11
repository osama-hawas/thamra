
part of 'bloc.dart';

class GetContactStates {}

class GetContactLoadingState extends GetContactStates{}

class GetContactSuccessState extends GetContactStates{
 final ContactData data;
  GetContactSuccessState({required this.data});
}

class GetContactFailedState extends GetContactStates{}
