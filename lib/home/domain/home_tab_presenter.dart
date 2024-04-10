import 'package:drink_shop/home/data/models/category_product_model.dart';
import 'package:drink_shop/home/data/models/product_model.dart';
import 'package:drink_shop/home/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  Future<void> logout();
}

class HomeTabPresenterImpl extends HomeTabPresenter {

  final supabase = Supabase.instance.client;

  @override
  Future<List<CategoryProductModel>> fetchCategories() async  {
    var response = await supabase
        .from("categories")
        .select();
    return response.map((e) => CategoryProductModel.fromJson(e)).toList();
  }

  @override
  Future<void> fetchData(
    Function(List<ProductModel> p1) onFetchProducts,
    Function(List<CategoryProductModel> p1) onFetchCategories,
    Function(ProfileModel p1) onFetchProfile,
    Function() onStart,
    Function() onFinish,
    Function(String p1) onError
  ) async {
    onStart();
    onFetchProducts(await fetchProducts());
    onFetchCategories(await fetchCategories());
    onFetchProfile(await fetchProfile());
    onFinish();
  }

  @override
  Future<List<ProductModel>> fetchProducts() async {
    var response = await supabase
        .from("products")
        .select();
    return response.map((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Future<ProfileModel> fetchProfile() async {
    String idUser = supabase.auth.currentUser!.id;
    var profile = await supabase
        .from("profiles")
        .select()
        .eq("id_user", idUser)
        .single();
    return ProfileModel(
        id: idUser,
        fullname: profile["fullname"],
        email: supabase.auth.currentUser!.email!,
        avatar: profile["avatar"]
    );
  }

  @override
  Future<void> logout() async {
    await supabase.auth.signOut();
  }

}
