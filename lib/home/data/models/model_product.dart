import 'package:drink_shop/home/data/models/model_size.dart';
import 'package:env_flutter/env_flutter.dart';

class ModelProduct {
  final String id;
  final String title;
  final String description;
  final String idCategory;
  final List<ModelSize> sizes;
  final double rate;

  ModelProduct(
    {
      required this.id,
      required this.title,
      required this.description,
      required this.idCategory,
      required this.sizes,
      required this.rate
    }
  );

  static ModelProduct fromJson(Map<String, dynamic> json){
    return ModelProduct(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      idCategory: json["id_category"],
      sizes: (json["sizes"] as List).map((e) => ModelSize.fromJson(e)).toList(),
      rate: double.parse(double.parse(json["rate"].toString()).toStringAsFixed(2))  // говно
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "title": title,
      "description": description,
      "idCategory": idCategory,
      "sizes": sizes.map((e) => e.toJson()).toList(),
      "rate": rate
    };
  }

  String getCoverUrl(){
    var urlProject = dotenv.env["SUPABASE_URL"]!;
    return "$urlProject/storage/v1/object/public/covers/$id.jpg";
  }
}
