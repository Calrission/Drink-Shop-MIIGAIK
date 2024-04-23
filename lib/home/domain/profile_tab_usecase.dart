import 'package:drink_shop/core/device/storage.dart';
import 'package:drink_shop/core/utils/network.dart';
import 'package:drink_shop/home/data/repository/remote_repository.dart';
import 'package:get_it/get_it.dart';

class ProfileTabUseCase {

  RemoteHomeRepository repository = GetIt.I.get<RemoteHomeRepository>();
  var storage = GetIt.I.get<Storage>();

  Future<bool> pressLogout(
    Function() onResponse,
    Function(String) onError
  ) async {
    await request<void>(
        request: repository.logout,
        onResponse: (_){
          storage.clearIsRememberMe();
          onResponse();
        },
        onError: onError
    );
    return false;
  }
}