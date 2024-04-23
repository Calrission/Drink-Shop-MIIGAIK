import 'package:drink_shop/core/utils/network.dart';
import 'package:drink_shop/home/data/models/category_product_model.dart';
import 'package:drink_shop/home/data/models/product_model.dart';
import 'package:drink_shop/home/data/models/profile_model.dart';
import 'package:drink_shop/home/data/repository/remote_repository.dart';
import 'package:get_it/get_it.dart';

abstract class HomeTabUseCase {
  Future<void> fetchProducts(
      Function(List<ProductModel>) onResponse,
      Function(String) onError,
  );

  Future<void> fetchCategories(
      Function(List<CategoryProductModel>) onResponse,
      Function(String) onError,
  );

  Future<void> fetchProfile(
      Function(ProfileModel) onResponse,
      Function(String) onError,
  );
}

class HomeTabUseCaseImpl extends HomeTabUseCase {

  RemoteHomeRepository repository = GetIt.I.get<RemoteHomeRepository>();

  @override
  Future<void> fetchProducts(
      Function(List<ProductModel>) onResponse,
      Function(String) onError,
  ) async {
    await request(
        request: repository.getProducts,
        onResponse: onResponse,
        onError: onError
    );
  }

  @override
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

  @override
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
