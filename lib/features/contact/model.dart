part of 'bloc.dart';

class ContactModel {
  late final ContactData data;
  late final String status;
  late final String message;

  ContactModel.fromJson(Map<String, dynamic> json) {
    data = ContactData.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }
}

class ContactData {
  late final String phone;
  late final String email;
  late final String whatsapp;
  late final Social social;
  late final double lat;
  late final double lng;
  late final String location;

  ContactData.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
    whatsapp = json['whatsapp'];
    social = Social.fromJson(json['social']);
    lat = json['lat'];
    lng = json['lng'];
    location = json['location'];
  }
}

class Social {
  late final String facebook;
  late final String twitter;
  late final String instagram;

  Social.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
  }
}
