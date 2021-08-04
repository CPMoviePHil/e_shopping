import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shopping/configs/theme/colors.dart';
import 'package:e_shopping/data/category.dart';
import 'package:e_shopping/data/product.dart';
import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/cart_notifier.dart';
import 'package:e_shopping/providers/favorite.dart';
import 'package:e_shopping/screens/cart/cart.dart';
import 'package:e_shopping/screens/order/order_item.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/utils.dart';
import 'package:e_shopping/utils/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'call_action.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    required this.product,
  });
  final Product product;
  @override _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product get product => widget.product;
  String? selectedImageUrl;
  String? selectedSize;
  bool isPressed = false;

  @override
  void initState() {
    selectedImageUrl = product.imageUrls!.first;
    selectedSize = product.sizes?.first;
    super.initState();
  }

  void setSelectedImageUrl(String url) {
    setState(() {
      selectedImageUrl = url;
    });
  }

  void setSelectedSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  void setAddToCart() {
    setState(() {
      isPressed = true;
    });
  }

  List<Product> filterProducts ({required List<Product> products, required Category category,}) {
    return products.where((e) => e.category == category && e.name != widget.product.name,).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16,),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * .35,
                          ),
                          items: product.imageUrls!.map(
                                (e) {
                              return Container(
                                //padding: EdgeInsets.all(16),
                                child: Image.network(
                                  e,
                                  fit: BoxFit.cover,
                                  color: kGreyBackground,
                                  colorBlendMode: BlendMode.multiply,
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 0,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: AppLibScreen.appIcon(icon: Icons.arrow_back_sharp),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      product.name!,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "\$" + product.cost.toString(),
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    if (product.sizes != null)
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 12,),
                        child: Wrap(
                          runSpacing: 12,
                          spacing: 20,
                          children: product.sizes!.map((e) => WidgetsHelper.sizeItem(
                            context: context,
                            isSelected: e == selectedSize,
                            size: e,
                            onTap: () => setSelectedSize(e),
                          ),).toList(),
                        ),
                      ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.5,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => Share.share('check out my website https://example.com'),
              child: AppLibScreen.appIcon(
                icon: Icons.share_outlined,
              ),
            ),
            Consumer<FavoriteProvider>(
              builder: (context, favorite, child,) {
                if (favorite.products.contains(product)) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,),
                    child: AppLibScreen.favoriteWidget(
                      context: context,
                      message: S.current.removeFromFavorite,
                      onTap: () => favorite.remove(product: product),
                      isAdded: true,
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,),
                    child: AppLibScreen.favoriteWidget(
                      context: context,
                      message: S.current.addToFavorite,
                      onTap: () => favorite.add(product: product),
                      isAdded: false,
                    ),
                  );
                }
              },
            ),
            CartActionButton(
              labelText: S.current.addToCart,
              onTap: () {
                context.read<CartNotifier>().add(
                  OrderItem(
                    product: product,
                    selectedSize: selectedSize,
                    selectedColor: null,
                  ),
                );
                WidgetsHelper.showSnackBar(
                  context: context,
                  msg: S.current.addedToCart,
                );
              },
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                ),
              ),
              fontColor: Colors.black,
            ),
            CartActionButton(
              labelText: S.current.goToCart,
              onTap: () {
                WidgetsHelper.hideSnackBar(
                  context: context,
                );
                Utils.pushScreen(
                  context: context,
                  screen: CartScreen(),
                );
              },
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
              ),
              fontColor: Theme.of(context).backgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}