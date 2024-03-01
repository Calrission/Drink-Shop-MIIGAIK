import 'package:drink_shop/auth/data/models/sign_in_model.dart';
import 'package:drink_shop/auth/data/repository/remote_repository.dart';
import 'package:drink_shop/core/utils/network.dart';
import 'package:drink_shop/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class SignInPresenter {
  Future<void> pressButtonSignIn(SignInModel signInModel, bool isRememberMe);
}

class SignInPresenterImpl extends SignInPresenter {

  RemoteAuthRepository remoteAuthRepository = GetIt.I.get<RemoteAuthRepository>();

  final Function(Route) onNavigateTo;
  final Function(String) onError;

  SignInPresenterImpl({required this.onNavigateTo, required this.onError});

  @override
  Future<void> pressButtonSignIn(SignInModel signInModel, bool isRememberMe) async {
    requestToSignIn() async {
      await remoteAuthRepository.signIn(signInModel);
    }
    await request(
      request: requestToSignIn,
      onResponse: (_){
        onNavigateTo(MaterialPageRoute(builder: (_) => const HomePage()));
      },
      onError: onError
    );
  }
}