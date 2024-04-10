import 'package:drink_shop/home/data/models/model_size.dart';

class ProductModel {
  final String id;
  final String? cover;
  final String title;
  final String description;
  final String idCategory;
  final List<ModelSize> sizes;

  ProductModel(
    {
      required this.id,
      required this.cover,
      required this.title,
      required this.description,
      required this.idCategory,
      required this.sizes,
    }
  );

  static ProductModel fromJson(Map<String, dynamic> json){
    return ProductModel(
        id: json["id"],
        cover: json["cover"],
        title: json["title"],
        description: json["description"],
        idCategory: json["id_category"],
        sizes: (json["sizes"] as List).map((e) => ModelSize.fromJson(e)).toList()
    );
  }
}
