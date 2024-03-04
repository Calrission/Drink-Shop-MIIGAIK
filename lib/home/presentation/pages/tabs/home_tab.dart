import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/values/nums.dart';
import 'package:drink_shop/home/data/models/product_model.dart';
import 'package:drink_shop/home/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  StateWithLibrary<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends StateWithLibrary<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLibrary.colorBackground,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: mainHorizontalPadding),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate(
                [
                  ProductItem(
                    model: ProductModel(
                        cover: "",
                        title: "test",
                        description: "test",
                        category: "test",
                        cost: 0,
                        rating: 0.0
                    ),
                  ),
                  ProductItem(
                    model: ProductModel(
                        cover: "",
                        title: "test",
                        description: "test",
                        category: "test",
                        cost: 100,
                        rating: 0.0
                    ),
                  ),
                ],
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisExtent: 260.0
              ),
            ),
          )
        ],
      ),
    );
  }
}