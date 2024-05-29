import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/home/data/models/model_additive.dart';
import 'package:flutter/material.dart';

class AdditiveItem extends StatefulWidget {
  const AdditiveItem({super.key, required this.modelAdditive});

  final ModelAdditive modelAdditive;

  @override
  State<AdditiveItem> createState() => _AdditiveItemState();
}

class _AdditiveItemState extends StateWithLibrary<AdditiveItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFDEDEDE))
      ),
    );
  }
}