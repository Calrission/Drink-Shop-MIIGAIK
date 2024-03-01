import 'package:drink_shop/core/ui/theme/light_library_theme.dart';
import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/home/presentation/widgets/home_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  StateWithLibrary<HomePage> createState() => _HomePageState();
}

class _HomePageState extends StateWithLibrary<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightLibraryColors.colorBackground,
      bottomNavigationBar: HomeBottomNavBar(
        onChanged: (newIndex){

        },
      ),
      body: const Column(),
    );
  }
}