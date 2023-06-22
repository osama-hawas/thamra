part of 'bloc.dart';

class GetAddressesStates {}

class GetAddressesLoadingState extends GetAddressesStates{}

class GetAddressesSuccessState extends GetAddressesStates{
 final List<AddressData> list;
  GetAddressesSuccessState({required this.list});
}

class GetAddressesFailedState extends GetAddressesStates{}
