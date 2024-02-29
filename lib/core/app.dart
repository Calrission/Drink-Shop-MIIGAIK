import 'package:drink_shop/auth/presentation/pages/sign_up_page.dart';
import 'package:drink_shop/core/ui/theme/library_theme.dart';
import 'package:drink_shop/core/ui/theme/light_library_theme.dart';
import 'package:drink_shop/home/presentation/home_page.dart';
import 'package:drink_shop/on_boarding/presentation/on_boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'device/storage.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static LibraryTheme library(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>()!.currentLibraryTheme;
  }

  static void changeToLightTheme(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()!.changeTheme(lightLibraryTheme);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentLibraryTheme = lightLibraryTheme;

  void changeTheme(LibraryTheme newLibraryTheme){
    setState(() {
      currentLibraryTheme = newLibraryTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    Storage storage = GetIt.I.get<Storage>();
    Supabase supabase = GetIt.I.get<Supabase>();
    bool isAlreadySeeOnBoarding = storage.getIsSeeOnBoarding();
    bool isAlreadySignIn = supabase.client.auth.currentUser != null;
    bool isLaunchVerification = storage.getIsConfirmVerification();
    return MaterialApp(
      title: 'Drink Shop',
      theme: currentLibraryTheme.themeData,
      home: (isAlreadySeeOnBoarding) ?
        (isAlreadySignIn && !isLaunchVerification) ? const HomePage() : const SignUpPage()
      : const OnBoardingPage(),
    );
  }
}