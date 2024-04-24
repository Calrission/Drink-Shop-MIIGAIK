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
    List<Map<String, dynamic>> response = await supabase.rpc("get_all_product_ratings");
    List<ProductModel> result = response.map((e) => ProductModel.fromJson(e)).toList();
    return result;
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }

}