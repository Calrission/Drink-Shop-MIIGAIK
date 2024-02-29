import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drink_shop/core/values/strings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> checkNetworkConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

Future<void> request(
  {
    required Function request,
    required Function(dynamic) onResponse,
    required Function(String) onError
  }
) async {
  try {
    if (! await checkNetworkConnection()){
      onError(textErrorNetwork);
      return;
    }
    dynamic result = await request();
    onResponse(result);
  } on AuthException catch(e) {
    onError(e.message);
  } on PostgrestException catch(e){
    onError(e.message);
  } on Exception catch(e){
    onError(e.toString());
  }
}