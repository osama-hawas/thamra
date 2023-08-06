part of 'bloc.dart';

class CatigoryProductModel {
  late final List<ProductData> data;

  late final String status;
  late final String message;

  CatigoryProductModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data'])
        .map((e) => ProductData.fromJson(e))
        .toList();

    status = json['status'];
    message = json['message'];
  }
}

