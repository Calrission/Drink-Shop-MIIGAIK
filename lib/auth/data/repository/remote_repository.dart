import 'package:drink_shop/auth/data/models/sign_in_model.dart';
import 'package:drink_shop/auth/data/models/sign_up_model.dart';
import 'package:drink_shop/auth/data/repository/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteAuthRepository extends Repository {

  final Supabase _supabase = GetIt.I.get<Supabase>();

  @override
  Future<void> logout() async {
    _supabase.client.auth.signOut();
  }

  @override
  Future<void> sendOTP(String email) async {
    await _supabase.client.auth.resetPasswordForEmail(
      email
    );
  }

  @override
  Future<void> setNewPassword(String newPassword) async {
    await _supabase.client.auth.updateUser(
        UserAttributes(
          password: newPassword,
        )
    );
  }

  @override
  Future<void> signIn(SignInModel signInModel) async {
    await _supabase.client.auth.signInWithPassword(
      email: signInModel.email,
      password: signInModel.password
    );
  }

  @override
  Future<void> signUp(SignUpModel signUpModel) async {
    await _supabase.client.auth.signUp(
      email: signUpModel.email,
      password: signUpModel.password,
      data: {
        "fullname": signUpModel.fullName
      }
    );
  }

  @override
  Future<void> verificationCode(String email, String code) async {
    await _supabase.client.auth.verifyOTP(
      token: code,
      email: email,
      type: OtpType.email
    );
  }

  @override
  Future<void> googleOAuth2() async {
    throw UnimplementedError();
  }
}