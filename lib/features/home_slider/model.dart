class ImageSliderModel {
  late final List<ImageModel> data;

  ImageSliderModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => ImageModel.fromJson(e)).toList();
  }
}

class ImageModel {
  late final int id;
  late final String image;

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['media'];
  }
}
