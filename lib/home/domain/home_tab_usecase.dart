import 'package:drink_shop/core/utils/network.dart';
import 'package:drink_shop/home/data/models/category_product_model.dart';
import 'package:drink_shop/home/data/models/product_model.dart';
import 'package:drink_shop/home/data/models/profile_model.dart';
import 'package:drink_shop/home/data/repository/remote_repository.dart';
import 'package:get_it/get_it.dart';

class HomeTabUseCase {

  RemoteHomeRepository repository = GetIt.I.get<RemoteHomeRepository>();

  Future<void> fetchProducts(
      Function(List<ProductModel>) onResponse,
      Function(String) onError,
  ) async {
    requestGetProducts() async {
      var products = await repository.getProducts();
      for (var element in products){
        var rate = await repository.getRatingProduct(element.id);
        element.rate = rate;
      }
      return products;
    }
    await request<List<ProductModel>>(
        request: requestGetProducts,
        onResponse: onResponse,
        onError: onError
    );
  }

  Future<void> fetchProfile(
      Function(ProfileModel) onResponse,
      Function(String) onError,
  ) async {
    await request<ProfileModel>(
        request: repository.getCurrentUserProfile,
        onResponse: onResponse,
        onError: onError
    );
  }

  Future<bool> pressLogout() async {
    await request<void>(
      request: repository.logout,
      onResponse: (_){
        return true;
      },
      onError: (_){
        return false;
      }
    );
    return false;
  }

  Future<void> fetchCategories(
      Function(List<CategoryProductModel>) onResponse,
      Function(String) onError
  ) async {
    await request(
      request: repository.getCategories,
      onResponse: onResponse,
      onError: onError
    );
  }
}
