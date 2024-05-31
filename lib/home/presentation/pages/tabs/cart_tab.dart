import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:flutter/material.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  StateWithLibrary<CartTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends StateWithLibrary<CartTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLibrary.colorBackground,
      body: Padding(
        padding: const EdgeInsets.only(left: 22, right: 22, top: 72),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}