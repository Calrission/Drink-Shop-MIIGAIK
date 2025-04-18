import 'package:drink_shop/auth/data/models/sign_up_model.dart';
import 'package:drink_shop/auth/data/repository/remote_repository.dart';
import 'package:drink_shop/core/utils/network.dart';
import 'package:drink_shop/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class SignUpUseCase {
  Future<void> pressButtonSignUp(SignUpModel signUpModel);
}

class SignUpUseCaseImpl extends SignUpUseCase {

  RemoteAuthRepository remoteAuthRepository = GetIt.I.get<RemoteAuthRepository>();

  final Function(Route) onNavigateTo;
  final Function(String) onError;

  SignUpUseCaseImpl({required this.onNavigateTo, required this.onError});

  @override
  Future<void> pressButtonSignUp(SignUpModel signUpModel) async {
    requestToSignUp() async {
      await remoteAuthRepository.signUp(signUpModel);
    }
    await request(
        request: requestToSignUp,
        onResponse: (_){
          onNavigateTo(MaterialPageRoute(builder: (_) => const HomePage()));
        },
        onError: onError
    );
  }
}