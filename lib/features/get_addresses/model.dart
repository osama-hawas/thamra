part of 'bloc.dart';

class AddressesModel {
  late final List<AddressData> addressData;
  late final String status;
  late final String message;

  AddressesModel.fromJson(Map<String, dynamic> json) {
    addressData = List.from(json['data']).map((e) => AddressData.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }
}

class AddressData {
  late final int id;
  late final String type;
  late final double lat;
  late final double lng;
  late final String location;
  late final String description;
  late final bool isDefault;
  late final String phone;

  AddressData.fromJson(Map<String, dynamic> json) {
    id = json['id']??"";
    type = json['type']??"";
    lat = json['lat']??0;
    lng = json['lng']??0;
    location = json['location']??"";
    description = json['description']??"";
    isDefault = json['is_default']??false;
    phone = json['phone']??"";
  }
}
