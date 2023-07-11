part of 'bloc.dart';

class CatigoryProductEvents {}
class GetCatigoryProductEvent extends CatigoryProductEvents{
  final int id;

  GetCatigoryProductEvent({required this.id});
}
