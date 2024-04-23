import 'package:drink_shop/auth/data/repository/remote_repository.dart';
import 'package:drink_shop/auth/presentation/pages/verification_page.dart';
import 'package:drink_shop/core/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class ForgotPasswordUseCase {

  ForgotPasswordUseCase();

  void pressButtonSendCode(String email);
}

class ForgotPasswordUseCaseImpl extends ForgotPasswordUseCase {
  RemoteAuthRepository remoteAuthRepository = GetIt.I.get<RemoteAuthRepository>();

  final Function(Route) onNavigate;
  final Function(String) onError;

  ForgotPasswordUseCaseImpl({required this.onNavigate, required this.onError});

  @override
  Future<void> pressButtonSendCode(String email) async {
    requestToVerification() async {
      await remoteAuthRepository.sendOTP(email);
    }
    await request(
      request: requestToVerification,
      onResponse: (_){
        onNavigate(MaterialPageRoute(builder: (_) => VerificationPage(email: email)));
      },
      onError: onError
    );
  }
}