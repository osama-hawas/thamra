part of 'bloc.dart';

class ActiveAcountState {}

class ActiveAcountLoadingState extends ActiveAcountState {}

class ActiveAcountSuccessState extends ActiveAcountState {
  final String msg;

  ActiveAcountSuccessState({required this.msg}) {
    showMSG(message: msg);
  }
}

class ActiveAcountFailedState extends ActiveAcountState {
  final String msg;

  ActiveAcountFailedState({required this.msg}) {
    showMSG(message: msg);
  }
}
