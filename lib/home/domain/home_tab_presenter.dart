import 'package:drink_shop/home/data/models/category_product_model.dart';
import 'package:drink_shop/home/data/models/product_model.dart';
import 'package:drink_shop/home/data/models/profile_model.dart';
import 'package:drink_shop/home/data/repository/local_test_repository.dart';

abstract class HomeTabPresenter {
  Future<void> fetchData(
    Function(List<ProductModel> ) onFetchProducts,
    Function(List<CategoryProductModel> ) onFetchCategories,
    Function(ProfileModel) onFetchProfile,
    Function() onStart,
    Function() onFinish,
    Function(String) onError
  );
  Future<List<ProductModel>> fetchProducts();
  Future<List<CategoryProductModel>> fetchCategories();
  Future<ProfileModel> fetchProfile();
}

class TestDataHomeTabPresenterImpl extends HomeTabPresenter {

  final LocalTestRepository testRepository = LocalTestRepository();

  @override
  Future<List<CategoryProductModel>> fetchCategories() {
    return testRepository.getCategories();
  }

  @override
  Future<void> fetchData(
    Function(List<ProductModel> ) onFetchProducts,
    Function(List<CategoryProductModel> ) onFetchCategories,
    Function(ProfileModel) onFetchProfile,
    Function() onStart,
    Function() onFinish,
    Function(String) onError
  ) async {
    onStart();
    onFetchProducts(await fetchProducts());
    onFetchCategories(await fetchCategories());
    onFetchProfile(await fetchProfile());
    onFinish();
  }

  @override
  Future<List<ProductModel>> fetchProducts() {
    return testRepository.getProducts();
  }

  @override
  Future<ProfileModel> fetchProfile() {
    return testRepository.getCurrentUserProfile();
  }
}
