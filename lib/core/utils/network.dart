import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drink_shop/core/ui/dialogs/dialog_message.dart';
import 'package:drink_shop/core/ui/strings.dart';
import 'package:flutter/material.dart';

Future<bool> checkNetworkConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}


Future<void> checkNetworkConnectionAndComplete(
  BuildContext context,
  Function onGood
) async {
  if (await checkNetworkConnection()){
    if (context.mounted) {
      MessageDialog.showError(context, textErrorNetwork);
    }
  }else{
    onGood();
  }
}
