import 'dart:async';

import 'package:drink_shop/core/utils/hash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  late final SharedPreferences _sharedPreferences;

  Storage(this._sharedPreferences);

  static Future<Storage> getInstance() async {
    return Storage(await SharedPreferences.getInstance());
  }

  Future<void> _saveString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  T? _getKey<T>(String key){
    return _sharedPreferences.get(key) as T?;
  }

  Future<void> _saveBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  Future<void> saveIsRememberMe(bool value) async {
    await _saveBool("isRememberMe", value);
  }

  bool getIsRememberMe() {
    return _getKey("isRememberMe") ?? false;
  }

  bool getIsSeeOnBoarding() {
    return _getKey("isSeeOnBoarding") ?? false;
  }

  Future<void> saveIsSeeOnBoarding() async {
    await _saveBool("isSeeOnBoarding", true);
  }

  Future<void> saveFullName(String fullName ) async {
    await _saveString("fullName", fullName);
  }

  Future<void> saveEmail(String email) async {
    await _saveString("email", email);
  }

  Future<void> savePasswordSHA512(String password) async {
    var hash = hash512(password);
    await _saveString("password", hash);
  }

  Future<void> saveIsConfirmVerification() async {
    await _saveBool("isConfirmVerification", true);
  }

  Future<void> clearConfirmVerification() async {
    await _saveBool("isConfirmVerification", false);
  }

  bool getIsConfirmVerification() {
    return _getKey("isConfirmVerification") ?? false;
  }

  void clearIsRememberMe() {
    _sharedPreferences.remove("isRememberMe");
    _sharedPreferences.remove("email");
    _sharedPreferences.remove("password");
  }
}