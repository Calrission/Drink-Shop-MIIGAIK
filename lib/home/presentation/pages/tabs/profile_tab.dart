import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  StateWithLibrary<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends StateWithLibrary<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLibrary.colorBackground,
    );
  }
}