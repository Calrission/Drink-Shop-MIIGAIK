import 'package:drink_shop/core/ui/theme/stateless_widget_with_library.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:drink_shop/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItem extends StatelessWidgetWithLibrary {

  final ProductModel model;

  ProductItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    init(context);
    return Container(
      decoration: BoxDecoration(
        color: colorLibrary.colorBlock,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 14/13,
              child: Image.network(
                "https://proprikol.ru/wp-content/uploads/2020/08/kartinki-kofe-52.jpg",
                fit: BoxFit.cover
              ),
            ),
          ),
          12.asHeight(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title, style: textLibrary.titleProduct),
                4.asHeight(),
                Text(model.cost.toString(), style: textLibrary.subTitleProduct),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/ruble.svg"),
                    4.asWidth(),
                    Text("${model.cost}", style: textLibrary.price).expanded(),
                    SizedBox.square(
                        dimension: 32,
                        child: FilledButton(
                          onPressed: (){},
                          style: FilledButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          child: const Icon(Icons.add, color: Colors.white, size: 16),
                        )
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}