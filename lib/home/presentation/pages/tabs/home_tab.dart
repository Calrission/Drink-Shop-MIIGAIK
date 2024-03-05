import 'package:drink_shop/core/ui/dialogs/dialog_message.dart';
import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:drink_shop/core/values/nums.dart';
import 'package:drink_shop/home/data/models/category_product_model.dart';
import 'package:drink_shop/home/data/models/product_model.dart';
import 'package:drink_shop/home/data/models/profile_model.dart';
import 'package:drink_shop/home/domain/home_tab_presenter.dart';
import 'package:drink_shop/home/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  StateWithLibrary<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends StateWithLibrary<HomeTab> {
  final HomeTabPresenter presenter = TestDataHomeTabPresenterImpl();
  bool isFinishFetchData = false;
  List<ProductModel> products = [];
  List<CategoryProductModel> categories = [];
  late ProfileModel profile;

  @override
  void initState() {
    super.initState();
    presenter.fetchData(
      (products) => this.products = products,
      (categories) => this.categories = categories,
      (profile) => this.profile = profile,
      () => null,
      () => setState(() {isFinishFetchData = true;}),
      showError
    );
  }

  void showError(String error){
    MessageDialog.showError(context, error);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLibrary.colorBackground,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
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
          ),
          24.asSliverHeight(),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: mainHorizontalPadding),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate(
                products.map((e) => ProductItem(model: e)).toList()
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisExtent: 260.0),
            ),
          )
        ],
      ),
    );
  }
}
