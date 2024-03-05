class ProductModel {
  final String cover;
  final String title;
  final String description;
  final String idCategory;
  final int cost;
  final double rating;

  ProductModel(
    {
      required this.cover,
      required this.title,
      required this.description,
      required this.idCategory,
      required this.cost,
      required this.rating
    }
  );
}
