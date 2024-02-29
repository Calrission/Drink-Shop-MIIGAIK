import 'package:drink_shop/core/app.dart';
import 'package:drink_shop/core/ui/theme/library_theme.dart';
import 'package:flutter/material.dart';

class StateWithLibrary<T extends StatefulWidget> extends State<T>{

  late final LibraryTheme library;
  late final LibraryTextThemes textLibrary;
  late final LibraryColors colorLibrary;

  @override
  void initState() {
    super.initState();
    library = MyApp.library(context);
    textLibrary = library.libraryTextThemes;
    colorLibrary = library.libraryColors;
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}