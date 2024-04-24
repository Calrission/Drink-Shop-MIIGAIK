import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:drink_shop/home/data/models/model_product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItem extends StatefulWidget {

  final ModelProduct product;

  const ProductItem({super.key, required this.product});

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
              aspectRatio: 1/1,
              child: Stack(
                children: [
                  CachedNetworkImage(
                      imageUrl: widget.product.getCoverUrl(),
                      fit: BoxFit.fill,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                        ),
                      )),
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) {
                        if (kDebugMode) {
                          print(StackTrace.current.toString());
                        }
                        return Image.asset(
                            "assets/images/coffee.png",
                            fit: BoxFit.cover,
                            height: double.infinity
                        );
                      }
                  ),
                  (widget.product.rate != 0)
                    ? BlurryContainer(
                        blur: 5,
                        color: Colors.transparent,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(16)
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 18
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/star.svg",
                              width: 8,
                              height: 8,
                              color: colorLibrary.colorStar
                            ),
                            4.asWidth(),
                            Text(widget.product.rate.toString(),
                              style: textLibrary.starRateText
                            ),
                          ],
                        ),
                      )
                    : const SizedBox()
                ]
              )
            ),
          ).expanded(),
          12.asHeight(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.product.title,
                      textAlign: TextAlign.start,
                      style: textLibrary.titleProduct,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Column(
                  children: [
                    4.asHeight(),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/ruble.svg"),
                        4.asWidth(),
                        Text("${widget.product.sizes[0].cost}", style: textLibrary.price).expanded(),
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
                    16.asHeight(),
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