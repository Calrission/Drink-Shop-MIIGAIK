import 'package:drink_shop/auth/data/repository/remote_repository.dart';
import 'package:drink_shop/auth/presentation/pages/set_new_password_page.dart';
import 'package:drink_shop/core/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class VerificationPresenter {
  void pressButtonConfirmCode(String email, String code);
}

class VerificationPresenterImpl extends VerificationPresenter {

  RemoteAuthRepository remoteAuthRepository = GetIt.I.get<RemoteAuthRepository>();
  final Function(Route) onNavigate;
  final Function(String) onError;

  VerificationPresenterImpl({required this.onNavigate, required this.onError});

  @override
  void pressButtonConfirmCode(String email, String code) {
    requestToConfirmCode() async {
      await remoteAuthRepository.verificationCode(email, code);
    }
    request(
      request: requestToConfirmCode,
      onResponse: (_){
        onNavigate(
          MaterialPageRoute(builder: (_) => const SetNewPasswordPage())
        );
      },
      onError: onError
    );
  }
}