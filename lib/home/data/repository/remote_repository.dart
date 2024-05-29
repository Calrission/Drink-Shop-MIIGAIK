import 'package:drink_shop/home/data/models/model_cart_item.dart';
import 'package:drink_shop/home/data/models/model_category.dart';
import 'package:drink_shop/home/data/models/model_get.dart';
import 'package:drink_shop/home/data/models/model_product.dart';
import 'package:drink_shop/home/data/models/model_profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteHomeRepository {

  final supabase = Supabase.instance.client;

  Future<List<ModelCategory>> getCategories() async {
    var response = await supabase
        .from("categories")
        .select();
    return response.map((e) => ModelCategory.fromJson(e)).toList();
  }

  Future<ModelProfile> getCurrentUserProfile() async {
    String idUser = supabase.auth.currentUser!.id;
    var profile = await supabase
        .from("profiles")
        .select()
        .eq("id_user", idUser)
        .single();
    return ModelProfile(
        id: idUser,
        fullname: profile["fullname"],
        email: supabase.auth.currentUser!.email!,
        avatar: profile["avatar"]
    );
  }

  Future<ModelGeo> getGeoUser() {
    throw UnimplementedError();
  }

  Future<List<ModelProduct>> getProducts() async {

    List<Map<String, dynamic>> response = await supabase.rpc("get_all_product_ratings");
    List<ModelProduct> result = response.map((e) => ModelProduct.fromJson(e)).toList();
    return result;
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  Future<void> addProductToCart(
    ModelCartItem modelCartItem
  ) async {
     var metadata = supabase.auth.currentUser?.userMetadata ?? {};
     if (!metadata.containsKey("cart")){
       metadata["cart"] = [];
     }
     metadata["cart"].add(modelCartItem.toJson());
     await supabase.auth.updateUser(UserAttributes(data: metadata));
  }

  Future<void> removeProductFromCart(String idProductCart) async {
    var metadata = supabase.auth.currentUser?.userMetadata ?? {};
    if (!metadata.containsKey("cart")){
      return;
    }
    (metadata["cart"] as List<Map<String, dynamic>>).removeWhere((e) => e["id"] == idProductCart);
    await supabase.auth.updateUser(UserAttributes(data: metadata));
  }

  List<ModelCartItem> fetchCart() {
    var metadata = supabase.auth.currentUser?.userMetadata ?? {};
    if (!metadata.containsKey("cart")){
      return [];
    }
    return (metadata["cart"] as List<Map<String, dynamic>>).map((e) => ModelCartItem.fromJson(e)).toList();
  }
}