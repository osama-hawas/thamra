class ProductsModel {
  late final List<ProductData> productData;

  late final String status;
  late final String message;
  late final int userCartCount;
  late final double maxPrice;
  late final double minPrice;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    productData = List.from(json['data']).map((e) => ProductData.fromJson(e)).toList();

    status = json['status'];
    message = json['message'];
    userCartCount = json['user_cart_count'];
    maxPrice = json['max_price'];
    minPrice = json['min_price'];
  }
}

class ProductData {
  late final int categoryId;
  late final int id;
  late final String title;
  late final String description;
  late final String code;
  late final int priceBeforeDiscount;
  late final num price;
  late final double discount;
  late final int amount;
  late final int isActive;
  late final bool isFavorite;
  late final Unit unit;
  late final List<Images> images;
  late final String mainImage;
  late final String createdAt;

  ProductData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id']??0;
    id = json['id']??0;
    title = json['title']??"";
    description = json['description']??"";
    code = json['code']??"";
    priceBeforeDiscount = json['price_before_discount']??0;
    price = json['price']??0;
    discount = json['discount']??0;
    amount = json['amount']??0;
    isActive = json['is_active']??0;
    isFavorite = json['is_favorite']??false;
    unit = Unit.fromJson(json['unit']);
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    mainImage = json['main_image']??"";
    createdAt = json['created_at']??"";
  }
}

class Unit {
  Unit({
    required this.id,
    required this.name,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  late final int id;
  late final String name;
  late final String type;
  late final String createdAt;
  late final String updatedAt;

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Images {
  late final String name;
  late final String url;

  Images.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}



