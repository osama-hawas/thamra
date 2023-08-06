part of 'bloc.dart';

class DeleteFromCartEvents{}
class DeleteFromCartEvent extends DeleteFromCartEvents {
final int id ;

  DeleteFromCartEvent({required this.id});


}