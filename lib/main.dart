import 'package:drink_shop/auth/data/repository/remote_repository.dart';
import 'package:drink_shop/core/device/storage.dart';
import 'package:drink_shop/home/data/repository/remote_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/app.dart';
import 'package:env_flutter/env_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileNames: ["assets/keys.env"]);
  await Supabase.initialize(
    url: dotenv.env["SUPABASE_URL"]!,
    anonKey: dotenv.env["SUPABASE_ANNON_KEY"]!,
  );
  GetIt.instance.registerSingleton(await Storage.getInstance());
  GetIt.instance.registerSingleton(RemoteAuthRepository());
  GetIt.instance.registerSingleton(RemoteHomeRepository());
  runApp(const MyApp());
}