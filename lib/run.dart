import 'package:drink_shop/core/device/storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/app.dart';
import 'package:env_flutter/env_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.env["SUPABASE_URL"]!,
    anonKey: dotenv.env["SUPABASE_ANNON_KEY"]!,
  );
  GetIt.instance.registerSingleton(await Storage.getInstance());
  runApp(const MyApp());
}