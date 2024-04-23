import 'package:drink_shop/home/data/models/category_product_model.dart';
import 'package:drink_shop/home/data/models/geo_model.dart';
import 'package:drink_shop/home/data/models/product_model.dart';
import 'package:drink_shop/home/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteHomeRepository {

  final supabase = Supabase.instance.client;

  Future<List<CategoryProductModel>> getCategories() async {
    var response = await supabase
        .from("categories")
        .select();
    return response.map((e) => CategoryProductModel.fromJson(e)).toList();
  }

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

  Future<GeoModel> getGeoUser() {
    throw UnimplementedError();
  }

  Future<List<ProductModel>> getProducts() async {
    var response = await supabase
        .from("products")
        .select();
    return response.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  Future<double> getRatingProduct(
    String productId
  ) async {
    var response = await supabase
        .from("reviews")
        .select()
        .eq("id_product", productId);

    var allRate = response.map((e) => e["rate"] as int);
    if (allRate.isEmpty){
      return 0;
    }
    var sumRate = allRate.reduce((e1, e2) => e1 + e2);
    var avgRate = sumRate / allRate.length;
    return double.parse(avgRate.toStringAsFixed(2));
  }

}