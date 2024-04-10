import 'package:drink_shop/auth/data/models/sign_in_model.dart';
import 'package:drink_shop/auth/data/models/sign_up_model.dart';
import 'package:drink_shop/auth/data/repository/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteAuthRepository extends Repository {

  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<void> logout() async {
    _supabase.auth.signOut();
  }

  @override
  Future<void> sendOTP(String email) async {
    await _supabase.auth.resetPasswordForEmail(
      email
    );
  }

  @override
  Future<void> setNewPassword(String newPassword) async {
    await _supabase.auth.updateUser(
        UserAttributes(
          password: newPassword,
        )
    );
  }

  @override
  Future<void> signIn(SignInModel signInModel) async {
    await _supabase.auth.signInWithPassword(
      email: signInModel.email,
      password: signInModel.password
    );
  }

  @override
  Future<void> signUp(SignUpModel signUpModel) async {
    await _supabase.auth.signUp(
      email: signUpModel.email,
      password: signUpModel.password,
      data: {
        "fullname": signUpModel.fullName
      }
    );

    await _supabase.from("profiles")
      .insert({
        "id_user": _supabase.auth.currentUser!.id,
        "fullname": signUpModel.fullName
      });
  }

  @override
  Future<void> verificationCode(String email, String code) async {
    await _supabase.auth.verifyOTP(
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