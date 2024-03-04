import 'package:drink_shop/core/app.dart';
import 'package:drink_shop/core/ui/theme/library_theme.dart';
import 'package:flutter/material.dart';

class StatelessWidgetWithLibrary extends StatelessWidget {

  late final LibraryTheme library;
  late final LibraryTextThemes textLibrary;
  late final LibraryColors colorLibrary;

  StatelessWidgetWithLibrary({super.key});

  void init(BuildContext context){
    library = MyApp.library(context);
    textLibrary = library.libraryTextThemes;
    colorLibrary = library.libraryColors;
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

}