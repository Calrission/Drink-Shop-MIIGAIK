class CategoryProductModel {
  final String id;
  final String title;

  CategoryProductModel({required this.id, required this.title});

  static CategoryProductModel fromJson(Map<String, dynamic> json){
    return CategoryProductModel(id: json["id"]!, title: json["title"]!);
  }
}