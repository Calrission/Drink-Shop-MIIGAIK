import 'package:drink_shop/core/ui/theme/light_library_theme.dart';
import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/home/presentation/pages/tabs/cart_tab.dart';
import 'package:drink_shop/home/presentation/pages/tabs/favorite_tab.dart';
import 'package:drink_shop/home/presentation/pages/tabs/home_tab.dart';
import 'package:drink_shop/home/presentation/pages/tabs/profile_tab.dart';
import 'package:drink_shop/home/presentation/widgets/home_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  StateWithLibrary<HomePage> createState() => _HomePageState();
}

class _HomePageState extends StateWithLibrary<HomePage> {

  int currentIndex = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightLibraryColors.colorBackground,
      bottomNavigationBar: HomeBottomNavBar(
        onChanged: (newIndex){
          currentIndex = newIndex;
          controller.animateToPage(
            newIndex,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear
          );
        },
        currentIndex: currentIndex,
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (newIndex){
          setState(() {
            currentIndex = newIndex;
          });
        },
        children: const [
          HomeTab(),
          FavoriteTab(),
          CartTab(),
          ProfileTab()
        ],
      ),
    );
  }
}