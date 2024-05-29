import 'package:drink_shop/core/utils/network.dart';
import 'package:drink_shop/home/data/models/model_cart_item.dart';
import 'package:drink_shop/home/data/models/model_category.dart';
import 'package:drink_shop/home/data/models/model_product.dart';
import 'package:drink_shop/home/data/models/model_profile.dart';
import 'package:drink_shop/home/data/repository/remote_repository.dart';
import 'package:drink_shop/home/data/storage/products.dart';
import 'package:get_it/get_it.dart';

class HomeTabUseCase {

  RemoteHomeRepository repository = GetIt.I.get<RemoteHomeRepository>();

  Future<void> fetchProducts(
      Function(List<ModelProduct>) onResponse,
      Function(String) onError,
  ) async {
    await request<List<ModelProduct>>(
      request: repository.getProducts,
      onResponse: (products){
        allProducts = products;
        onResponse(products);
      },
      onError: onError
    );
  }

  Future<void> fetchCategories(
      Function(List<ModelCategory>) onResponse,
      Function(String) onError,
  ) async {
    await request<List<ModelCategory>>(
      request: repository.getCategories,
      onResponse: (categories){
        for (var category in categories) {
          category.products = allProducts.where((e) => e.idCategory == category.id).toList();
        }
        categories.insert(0, ModelCategory(id: "", title: "All", products: allProducts));
        onResponse(categories);
      },
      onError: onError
    );
  }

  Future<void> fetchProfile(
      Function(ModelProfile) onResponse,
      Function(String) onError,
  ) async {
    await request<ModelProfile>(
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
}
