part of 'bloc.dart';

class CityData {
  late final List<CityModel> cityModel;

  CityData.fromJson(Map<String, dynamic> json) {
    cityModel = List.from(json['data'] ?? [])
        .map((e) => CityModel.fromJson(e))
        .toList();
  }
}

class CityModel {
  late final String id;
  late final String name;

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
  }
}
