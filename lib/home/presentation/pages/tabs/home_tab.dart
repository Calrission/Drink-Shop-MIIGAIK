import 'package:drink_shop/core/ui/dialogs/dialog_loading.dart';
import 'package:drink_shop/core/ui/dialogs/dialog_message.dart';
import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:drink_shop/core/values/nums.dart';
import 'package:drink_shop/home/data/models/model_category.dart';
import 'package:drink_shop/home/data/models/model_product.dart';
import 'package:drink_shop/home/data/models/model_profile.dart';
import 'package:drink_shop/home/domain/home_tab_usecase.dart';
import 'package:drink_shop/home/presentation/pages/search_result_page.dart';
import 'package:drink_shop/home/presentation/widgets/category_item.dart';
import 'package:drink_shop/home/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  StateWithLibrary<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends StateWithLibrary<HomeTab> {
  final useCase = HomeTabUseCase();
  bool isFinishFetchData = false;
  List<ModelProduct> products = [];
  List<ModelCategory> categories = [];
  late ModelProfile profile;
  ModelCategory? selectedModelCategory;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding
      .instance
      .addPostFrameCallback((_) async {
         await initData();
      });
  }

  Future<void> initData() async {
    LoadingDialog.show(context);
    await useCase.fetchProducts(
      (response) => setState(() {
        LoadingDialog.hide(context);
        products = response;
      }),
      showError
    );

    await useCase.fetchCategories(
      (categories) {
        LoadingDialog.hide(context);
        this.categories = categories;
        selectedModelCategory = categories.first;
      },
      showError
    );

    await useCase.fetchProfile(
      (response) => setState(() {
        LoadingDialog.hide(context);
        profile = response;
      }),
      showError
    );
  }

  void showError(String error){
    LoadingDialog.hide(context);
    MessageDialog.showError(context, error);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLibrary.colorBackground,
      body: Stack(
        children: [
        Container(
          height: 280,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF131313),
                Color(0xFF313131),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: mainHorizontalPadding),
          child: Column(
            children: [
              60.asHeight(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Местоположение", style: textLibrary.subText),
                      Text("проспект 60-летия Октября, 11", style: textLibrary.subTitle.copyWith(
                        color: colorLibrary.colorBlock
                      ))
                    ],
                  )
                ],
              ),
              24.asHeight(),
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
                        controller: textEditingController,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SearchResultPage(
                              searchText: textEditingController.text
                          ))
                        );
                      },
                      child: const Icon(Icons.navigate_next_rounded, color: Colors.white),
                    )
                  ],
                ),
              ),
              24.asHeight(),
              SizedBox(
                width: double.infinity,
                height: 38,
                child: ListView.separated(
                  itemBuilder: (_, position) => ItemCategory(
                    category: categories[position],
                    onSelected: (ModelCategory category) {
                      setState(() {
                        selectedModelCategory = category;
                      });
                    },
                    isSelect: selectedModelCategory == categories[position],
                  ),
                  separatorBuilder: (_, __) => 8.asWidth(),
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              24.asHeight(),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: selectedModelCategory?.products.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductItem(
                      product:
                        selectedModelCategory?.products[index]
                        ?? products[index]
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
              24.asHeight()
            ],
          ),
        )],
      ),
    );
  }
}
