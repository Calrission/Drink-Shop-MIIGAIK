import 'package:cached_network_image/cached_network_image.dart';
import 'package:drink_shop/core/ui/dialogs/dialog_loading.dart';
import 'package:drink_shop/core/ui/dialogs/dialog_message.dart';
import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:drink_shop/home/data/models/model_cart_item.dart';
import 'package:drink_shop/home/data/models/model_product.dart';
import 'package:drink_shop/home/domain/product_page_usecase.dart';
import 'package:drink_shop/home/presentation/widgets/size_item.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {

  final ModelProduct product;

  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends StateWithLibrary<ProductPage> {

  int currentSizeIndex = 0;
  int count = 1;

  ProductPageUseCase useCase = ProductPageUseCase();

  int calcCost(){
    return widget.product.sizes[currentSizeIndex].cost;
  }

  List<Widget> getContentRowSizes(){
    List<Widget> widgets = [];
    for (int i=0; i<2*widget.product.sizes.length-1; i++){
      if ((i+1)%2!=0){
        var size = widget.product.sizes[i - i~/2];
        widgets.add(
          Expanded(
            child: SizeItem(
              modelSize: size,
              onTap: () {
                setState(() {
                  currentSizeIndex = i - i~/2;
                });
              },
              isActive: i==currentSizeIndex + i~/2
            )
          )
        );
      }else{
        widgets.add(const SizedBox(width: 12));
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLibrary.colorBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Container(
              color: colorLibrary.colorBackground,
              padding: const EdgeInsets.only(top: 66),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF3A3A3A), size: 24)),
                  Expanded(
                      child: Center(child: Text("Детали", style: textLibrary.titleProduct.copyWith(fontSize: 18)))
                  ),
                  const Icon(Icons.favorite_border, color: Color(0xFF3A3A3A), size: 24),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 331/226,
                      child: CachedNetworkImage(imageUrl: widget.product.getCoverUrl()),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(children: [
                    Expanded(
                      child: Text(
                        widget.product.title,
                        style: textLibrary.titleProduct.copyWith(fontSize: 20)
                      )
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.star, color: Color(0xFFFBBE21), size: 24),
                    const SizedBox(width: 4),
                    Text(
                      widget.product.rate.toString(),
                      style: textLibrary.titleProduct
                    ),
                    const SizedBox(width: 16),
                  ]),
                  const SizedBox(height: 16),
                  Text(
                    "Описание",
                    style: textLibrary.titleProduct.copyWith(fontSize: 14)
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.product.description,
                    maxLines: 3,
                    style: textLibrary.subTitleProduct.copyWith(fontSize: 14)
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Размеры",
                    style: textLibrary.titleProduct.copyWith(fontSize: 14)
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: getContentRowSizes()
                  )
                ],
              ),
                        ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: Row(
                children: [
                   Column(
                    children: [
                      const Text("Цена"),
                      Text("${calcCost()}")
                    ],
                  ),
                  22.asWidth(),
                  Expanded(
                    child: FilledButton(
                      onPressed: () async {
                        LoadingDialog.show(context);
                        await useCase.pressAddToCart(
                          ModelCartItem(
                            product: widget.product,
                            selectSizeIndex: currentSizeIndex,
                            count: count
                          ),
                          (){
                            Navigator.pop(context);
                            MessageDialog.show(context, "Успешно", "Продукт успешно добавлен в корзину");
                          },
                          (){
                            Navigator.pop(context);
                            MessageDialog.showError(context, "Повторите попытку позже");
                          }
                        );
                      },
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 22),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                      ),
                      child: const Text("Добавить в корзину"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}