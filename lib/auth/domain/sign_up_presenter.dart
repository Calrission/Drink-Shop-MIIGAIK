import 'package:drink_shop/auth/data/models/sign_up_model.dart';
import 'package:drink_shop/auth/data/repository/remote_repository.dart';
import 'package:drink_shop/auth/presentation/pages/sign_in_page.dart';
import 'package:drink_shop/core/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class SignUpPresenter {
  Future<void> pressButtonSignUp(SignUpModel signUpModel);
}

class SignUpPresenterImpl extends SignUpPresenter {

  RemoteAuthRepository remoteAuthRepository = GetIt.I.get<RemoteAuthRepository>();

  final Function(Route) onNavigateTo;
  final Function(String) onError;

  SignUpPresenterImpl({required this.onNavigateTo, required this.onError});

  @override
  Future<void> pressButtonSignUp(SignUpModel signUpModel) async {
    requestToSignUp() async {
      await remoteAuthRepository.signUp(signUpModel);
    }
    await request(
        request: requestToSignUp,
        onResponse: (_){
          onNavigateTo(MaterialPageRoute(builder: (_) => const SignInPage()));
        },
        onError: onError
    );
  }
}