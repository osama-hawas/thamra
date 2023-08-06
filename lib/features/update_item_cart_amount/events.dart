part of 'bloc.dart';

class UpdateCartAmountEvents{}
class UpdateCartAmountEvent extends UpdateCartAmountEvents{
  final int amount ,id;

  UpdateCartAmountEvent({ required this.amount,required this.id});
}