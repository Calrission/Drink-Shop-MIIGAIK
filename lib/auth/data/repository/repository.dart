import 'package:drink_shop/auth/data/models/sign_in_model.dart';
import 'package:drink_shop/auth/data/models/sign_up_model.dart';

abstract class Repository {
  Future<void> signUp(SignUpModel signUpModel);
  Future<void> signIn(SignInModel signInModel);
  Future<void> googleOAuth2();
  Future<void> sendOTP(String email);
  Future<void> verificationCode(String email, String code);
  Future<void> setNewPassword(String newPassword);
  Future<void> logout();
}