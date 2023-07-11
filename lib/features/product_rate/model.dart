part of 'bloc.dart';

class ProductRateModel {

  late final List<ProductRateData> data;

  late final String status;
  late final String message;

  ProductRateModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>ProductRateData.fromJson(e)).toList();

    status = json['status'];
    message = json['message'];
  }


}

class ProductRateData {

  late final int value;
  late final String comment;
  late final String clientName;
  late final String clientImage;

  ProductRateData.fromJson(Map<String, dynamic> json){
    value = json['value'];
    comment = json['comment'];
    clientName = json['client_name'];
    clientImage = json['client_image'];
  }


}

