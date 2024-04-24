import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drink_shop/core/values/strings.dart';
import 'package:env_flutter/env_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> checkNetworkConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

Future<void> request<T>(
  {
    required Future<T> Function() request,
    required Function(T) onResponse,
    required Function(String) onError
  }
) async {
  try {
    if (! await checkNetworkConnection()){
      onError(textErrorNetwork);
      return;
    }
    T result = await request();
    onResponse(result);
  } on AuthException catch(e) {
    onError(e.message);
  } on PostgrestException catch(e){
    onError(e.message);
  } catch(e){
    if (kDebugMode) {
      print(StackTrace.current.toString());
    }
    onError(e.toString());
  }
}