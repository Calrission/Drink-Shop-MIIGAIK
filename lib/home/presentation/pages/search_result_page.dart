import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:drink_shop/core/values/nums.dart';
import 'package:drink_shop/home/data/models/model_product.dart';
import 'package:drink_shop/home/data/storage/products.dart';
import 'package:drink_shop/home/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResultPage extends StatefulWidget {

  final String searchText;

  const SearchResultPage({super.key, this.searchText = ""});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends StateWithLibrary<SearchResultPage> {

  TextEditingController controller = TextEditingController();
  List<ModelProduct> searchResult = [];

  @override
  void initState() {
    super.initState();
    controller.text = widget.searchText;
    WidgetsBinding.instance.addPostFrameCallback((_){
      refreshResult();
    });
  }

  void refreshResult(){
    var textSearch = controller.text;
    searchResult = allProducts.where(
      (product){
        return product.title.toLowerCase().contains(textSearch.toLowerCase());
      }
    ).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLibrary.colorBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: mainHorizontalPadding, vertical: 22),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF313131),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                      "assets/icons/search.svg",
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                  ),
                  12.asWidth(),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: textLibrary.text.copyWith(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Найти кофе, коктейль, газир...",
                        hintStyle: textLibrary.hint,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      refreshResult();
                    },
                    child: const Icon(Icons.navigate_next_rounded, color: Colors.white),
                  )
                ],
              ),
            ),
            24.asHeight(),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: searchResult.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem(
                    product: searchResult[index]
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3/5
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}