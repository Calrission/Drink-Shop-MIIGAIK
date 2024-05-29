import 'package:drink_shop/home/data/models/model_product.dart';
import 'package:uuid/uuid.dart';

class ModelCartItem{
  final String id;
  final ModelProduct product;
  final int selectSizeIndex;
  final int count;

  ModelCartItem({required this.product, required this.selectSizeIndex, required this.count}): id=const Uuid().v4();

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "product": product.toJson(),
      "selectSizeIndex": selectSizeIndex,
      "count": count.toString()
    };
  }

  static ModelCartItem fromJson(Map<String, dynamic> json){
    return ModelCartItem(
      product: ModelProduct.fromJson(json["product"]),
      selectSizeIndex: json["selectSizeIndex"], count: int.parse(json["count"])
    );
  }
}