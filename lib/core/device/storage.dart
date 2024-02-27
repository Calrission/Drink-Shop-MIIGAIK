import 'dart:async';

import 'package:drink_shop/core/utils/hash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  late final SharedPreferences _sharedPreferences;

  Storage(this._sharedPreferences);

  static Future<Storage> getInstance() async {
    return Storage(await SharedPreferences.getInstance());
  }

  void _saveString(String key, String value){
    _sharedPreferences.setString(key, value);
  }

  T? _getKey<T>(String key){
    return _sharedPreferences.get(key) as T?;
  }

  void _saveBool(String key, bool value){
    _sharedPreferences.setBool(key, value);
  }

  void saveIsRememberMe(bool value){
    _saveBool("isRememberMe", value);
  }

  bool getIsRememberMe(){
    return _getKey("isRememberMe") ?? false;
  }

  bool getIsSeeOnBoarding(){
    return _getKey("isSeeOnBoarding") ?? false;
  }

  void saveIsSeeOnBoarding(){
    _saveBool("isSeeOnBoarding", true);
  }

  void saveFullName(String fullName ){
    _saveString("fullName", fullName);
  }

  void saveEmail(String email){
    _saveString("email", email);
  }

  void savePasswordSHA512(String password){
    var hash = hash512(password);
    _saveString("password", hash);
  }
}