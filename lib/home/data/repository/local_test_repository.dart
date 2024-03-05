import 'package:drink_shop/home/data/models/category_product_model.dart';
import 'package:drink_shop/home/data/models/product_model.dart';
import 'package:drink_shop/home/data/models/profile_model.dart';
import 'package:drink_shop/home/data/repository/repository.dart';

class LocalTestRepository extends Repository {
  @override
  Future<List<CategoryProductModel>> getCategories() async {
    return [
      CategoryProductModel(id: "0", title: "Test_1"),
      CategoryProductModel(id: "1", title: "Test_2"),
      CategoryProductModel(id: "2", title: "Test_3"),
      CategoryProductModel(id: "3", title: "Test_4"),
      CategoryProductModel(id: "4", title: "Test_4"),
      CategoryProductModel(id: "5", title: "Test_4"),
    ];
  }

  @override
  Future<ProfileModel> getCurrentUserProfile() async {
    return ProfileModel(id: "0", fullname: "Test Test Test", email: "test@gmail.com");
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    return [
      ProductModel(
        cover: "assets/images/coffee.png",
        title: "Test",
        description: "Test DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest Description",
        idCategory: "0",
        cost: 100,
        rating: 5.0
      ),
      ProductModel(
          cover: "assets/images/coffee.png",
          title: "Test_2",
          description: "Test DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest Description",
          idCategory: "0",
          cost: 150,
          rating: 4.9
      ),
      ProductModel(
          cover: "assets/images/coffee.png",
          title: "Test_3",
          description: "Test DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest Description",
          idCategory: "1",
          cost: 200,
          rating: 4.5
      ),
      ProductModel(
          cover: "assets/images/coffee.png",
          title: "Test_4",
          description: "Test DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest Description",
          idCategory: "1",
          cost: 250,
          rating: 4.9
      ),
      ProductModel(
          cover: "assets/images/coffee.png",
          title: "Test_5",
          description: "Test DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest Description",
          idCategory: "0",
          cost: 200,
          rating: 5.0
      ),
      ProductModel(
          cover: "assets/images/coffee.png",
          title: "Test_6",
          description: "Test DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest Description",
          idCategory: "0",
          cost: 300,
          rating: 4.9
      ),
      ProductModel(
          cover: "assets/images/coffee.png",
          title: "Test_7",
          description: "Test DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest Description",
          idCategory: "1",
          cost: 100,
          rating: 4.5
      ),
      ProductModel(
          cover: "assets/images/coffee.png",
          title: "Test_8",
          description: "Test DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description\nTest DescriptionTest DescriptionTest DescriptionTest Description",
          idCategory: "1",
          cost: 220,
          rating: 4.9
      ),
    ];
  }

}