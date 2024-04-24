import 'package:drink_shop/home/data/models/model_product.dart';

class ModelCategory {
  final String id;
  final String title;
  List<ModelProduct> products = [];

  ModelCategory(
    {
      required this.id,
      required this.title,
      List<ModelProduct>? products
    }
  ): products = (products != null) ? products : [];

  static ModelCategory fromJson(Map<String, dynamic> json){
    return ModelCategory(
        id: json["id"]!,
        title: json["title"]!
    );
  }
}