import 'package:drink_shop/home/data/models/category_product_model.dart';
import 'package:drink_shop/home/data/models/geo_model.dart';
import 'package:drink_shop/home/data/models/product_model.dart';
import 'package:drink_shop/home/data/models/profile_model.dart';
import 'package:drink_shop/home/data/repository/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteHomeRepository extends HomeRepository {

  final supabase = Supabase.instance.client;

  @override
  Future<List<CategoryProductModel>> getCategories() async {
    var response = await supabase
        .from("categories")
        .select();
    return response.map((e) => CategoryProductModel.fromJson(e)).toList();
  }

  @override
  Future<ProfileModel> getCurrentUserProfile() async {
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
  Future<GeoModel> getGeoUser() {
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    var response = await supabase
        .from("products")
        .select();
    return response.map((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Future<void> logout() async {
    await supabase.auth.signOut();
  }

}