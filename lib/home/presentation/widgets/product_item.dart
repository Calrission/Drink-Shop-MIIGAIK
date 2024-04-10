import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:drink_shop/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItem extends StatefulWidget {

  final ProductModel model;

  const ProductItem({super.key, required this.model});

  @override
  StateWithLibrary<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends StateWithLibrary<ProductItem> {
  @override
  Widget build(BuildContext context) {
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
              child: (widget.model.cover?.contains("http") ?? false)
                  ? Image.network(widget.model.cover!, fit: BoxFit.cover)
                  // : Image.asset(widget.model.cover, fit: BoxFit.cover),
                  : SizedBox(width: 30, height: 30)
            ),
          ).expanded(),
          12.asHeight(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model.title,
                  style: textLibrary.titleProduct,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis
                ),
                4.asHeight(),
                Text(widget.model.sizes[0].cost.toString(), style: textLibrary.subTitleProduct),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/ruble.svg"),
                    4.asWidth(),
                    Text("${widget.model.sizes[0].cost}", style: textLibrary.price).expanded(),
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
                ),
                16.asHeight()
              ],
            ),
          )
        ],
      ),
    );
  }
}