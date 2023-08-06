part of 'bloc.dart';

class FavProductModel {
  late final List<ProductData> favProductData;
  late final String status;
  late final String message;

  FavProductModel.fromJson(Map<String, dynamic> json) {
    favProductData =
        List.from(json['data']).map((e) => ProductData.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }
}

