class CategoriesModel {
  late final List<CategoryData> categoryData;
 


  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoryData = List.from(json['data']).map((e) => CategoryData.fromJson(e)).toList();


  }
}

class CategoryData {
  late final int id;
  late final String name;
  late final String description;
  late final String media;

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    media = json['media'];
  }
}




