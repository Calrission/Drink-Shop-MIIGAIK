import 'package:drink_shop/core/ui/theme/library_theme.dart';
import 'package:drink_shop/core/ui/theme/light_library_theme.dart';
import 'package:drink_shop/on_boarding/presentation/on_boarding_page.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'Drink Shop',
      theme: currentLibraryTheme.themeData,
      home: const OnBoardingPage(),
    );
  }
}