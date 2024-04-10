class ModelSize {
  final String size;
  final int cost;

  ModelSize({required this.size, required this.cost});

  static ModelSize fromJson(Map<String, dynamic> json){
    return ModelSize(size: json["size"]!, cost: json["cost"]!);
  }
}