import 'package:drink_shop/core/utils/network.dart';
import 'package:drink_shop/home/data/models/model_cart_item.dart';
import 'package:drink_shop/home/data/repository/remote_repository.dart';
import 'package:get_it/get_it.dart';

class ProductPageUseCase {
  RemoteHomeRepository repository = GetIt.I.get<RemoteHomeRepository>();

  Future<void> pressAddToCart(
      ModelCartItem modelCartItem,
      Function() onGood,
      Function() onBad
  ) async {
    await request<void>(
      request: () async {
        await repository.addProductToCart(modelCartItem);
      },
      onResponse: (_){
        onGood();
      },
      onError: (_){
        onBad();
      }
    );
  }

  Future<bool> pressRemoveFromCart(
      String id,
      Function() onGood,
      Function() onBad
  ) async {
    await request<void>(
      request: () async {
        await repository.removeProductFromCart(id);
      },
      onResponse: (_){
        onGood();
      },
      onError: (_){
        onBad();
      }
    );
    return false;
  }
}