import 'package:drink_shop/home/data/models/category_product_model.dart';
import 'package:drink_shop/home/data/models/geo_model.dart';
import 'package:drink_shop/home/data/models/product_model.dart';
import 'package:drink_shop/home/data/models/profile_model.dart';

abstract class HomeRepository {
  Future<List<ProductModel>> getProducts();
  Future<List<CategoryProductModel>> getCategories();
  Future<ProfileModel> getCurrentUserProfile();
  Future<GeoModel> getGeoUser();
  Future<void> logout();
}