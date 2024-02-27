import 'dart:convert';

import 'package:crypto/crypto.dart';

String hash512(String data){
  return sha512.convert(utf8.encode(data)).toString();
}