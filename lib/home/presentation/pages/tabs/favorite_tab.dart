import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  StateWithLibrary<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends StateWithLibrary<FavoriteTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLibrary.colorBackground,
    );
  }
}