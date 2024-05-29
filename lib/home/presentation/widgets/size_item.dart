import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/home/data/models/model_additive.dart';
import 'package:drink_shop/home/data/models/model_size.dart';
import 'package:flutter/material.dart';

class SizeItem extends StatefulWidget {

  final Function() onTap;
  bool isActive;

  SizeItem(
    {
      super.key,
      required this.modelSize,
      this.isActive=false,
      required this.onTap
    }
  );

  final ModelSize modelSize;

  @override
  State<SizeItem> createState() => _SizeItemState();
}

class _SizeItemState extends StateWithLibrary<SizeItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: (widget.isActive)
            ? const Color(0xFFFFF5EE)
            : Colors.white,
          border: Border.all(
            color: (widget.isActive)
              ? colorLibrary.colorAccent
              : const Color(0xFFDEDEDE)
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: Text(
            widget.modelSize.size,
            style: (widget.isActive)
              ? textLibrary.text.copyWith(
                  color: colorLibrary.colorAccent
                )
              : textLibrary.text
          )
        ),
      ),
    );
  }
}