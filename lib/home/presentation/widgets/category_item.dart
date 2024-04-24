import 'package:drink_shop/core/app.dart';
import 'package:drink_shop/home/data/models/model_category.dart';
import 'package:flutter/material.dart';

class ItemCategory extends StatefulWidget {
  final ModelCategory category;
  final Function(ModelCategory) onSelected;
  bool isSelect;
  ItemCategory(
    {
      super.key,
      required this.category,
      required this.onSelected,
      this.isSelect = false
    }
  );

  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {

  @override
  Widget build(BuildContext context) {
    var textLibrary = MyApp.library(context).libraryTextThemes;
    var colorsLibrary = MyApp.library(context).libraryColors;
    return GestureDetector(
      onTap: (){
        widget.onSelected(widget.category);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: (widget.isSelect) ? colorsLibrary.colorAccent : colorsLibrary.colorBlock,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Text(
          widget.category.title,
          style: (widget.isSelect) ? textLibrary.activeTitleCategory : textLibrary.text,
        )
      ),
    );
  }
}