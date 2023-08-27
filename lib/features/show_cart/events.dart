part of 'bloc.dart';

class ShowCartEvents {}

class ShowCartEvent extends ShowCartEvents {
  final bool isOutLoading ;

  ShowCartEvent({this.isOutLoading= false});
}
