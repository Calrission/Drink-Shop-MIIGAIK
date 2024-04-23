import 'package:drink_shop/auth/data/repository/remote_repository.dart';
import 'package:drink_shop/auth/presentation/pages/sign_in_page.dart';
import 'package:drink_shop/core/device/storage.dart';
import 'package:drink_shop/core/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class SetNewPasswordUseCase {
  Future<void> pressButtonSetNewPassword(String newPassword);
}

class SetNewPasswordUseCaseImpl extends SetNewPasswordUseCase {

  RemoteAuthRepository remoteAuthRepository = GetIt.I.get<RemoteAuthRepository>();
  Storage storage = GetIt.I.get<Storage>();
  final Function(Route) navigateTo;
  final Function(String) onError;


  SetNewPasswordUseCaseImpl(
    {
      required this.navigateTo,
      required this.onError
    }
  );

  @override
  Future<void> pressButtonSetNewPassword(
    String newPassword
  ) async {
    requestToUpdatePassword() async {
      await remoteAuthRepository.setNewPassword(newPassword);
    }
    await request(
      request: requestToUpdatePassword,
      onResponse: (_) async {
        await storage.clearConfirmVerification();
        await remoteAuthRepository.logout();
        navigateTo(
          MaterialPageRoute(builder: (_) => const SignInPage()),
        );
      },
      onError: onError
    );
  }
}