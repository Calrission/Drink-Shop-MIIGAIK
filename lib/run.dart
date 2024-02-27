import 'package:drink_shop/core/device/storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'core/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.registerSingleton(await Storage.getInstance());
  runApp(const MyApp());
}