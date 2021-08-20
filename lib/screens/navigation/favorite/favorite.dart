import 'package:e_shopping/configs/theme/colors.dart';
import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/cart_notifier.dart';
import 'package:e_shopping/providers/favorite.dart';
import 'package:e_shopping/screens/order/order_item.dart';
import 'package:e_shopping/screens/product/loader.dart';
import 'package:e_shopping/screens/product/product_image.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/utils.dart';
import 'package:e_shopping/utils/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, favorite, child,) {
        if (favorite.products.length == 0) {
          return Center(
            child: AppLibScreen.appText(
              text: S.current.emptyFavorite,
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 5,),
            child: ListView.builder(
              itemCount: favorite.products.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,),
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5,
                            color: kGrey400,
                          ),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () => Utils.pushScreen(
                          context: context,
                          screen: ProductLoader(
                            product: favorite.products[index],
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5,),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 125,
                                child: ProductImage(
                                  product: favorite.products[index],
                                ),
                              ),
                              SizedBox(width: 16,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        favorite.products[index].name!,
                                        style: Theme.of(context).textTheme.subtitle1,
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Container(
                                      child: AppLibScreen.appText(
                                        text: "${favorite.products[index].cost}",
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        /*AppLibScreen.favoriteWidget(
                                        context: context,
                                        message: S.current.removeFromFavorite,
                                        onTap: () => favorite.remove(product: favorite.products[index]),
                                        isAdded: true,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),*/
                                        Tooltip(
                                          message: S.current.addToCart,
                                          child: GestureDetector(
                                            onTap: () async {
                                              CartSelector? selector;
                                              if (favorite.products[index].sizes != null) {
                                                selector = await WidgetsHelper.cartDialogWithSizes(
                                                  context: context,
                                                  sizes: favorite.products[index].sizes!,
                                                  counts: List.generate(10, (index) => index + 1).toList(),
                                                );
                                              } else {
                                                context.read<CartNotifier>().add(
                                                  orderItem: OrderItem(
                                                    product: favorite.products[index],
                                                    selectedSize: null,
                                                    selectedColor: null,
                                                  ),
                                                  count: 1,
                                                );
                                              }
                                              if (selector != null) {
                                                context.read<CartNotifier>().add(
                                                  orderItem: OrderItem(
                                                    product: favorite.products[index],
                                                    selectedSize: selector.selectedSize,
                                                    selectedColor: null,
                                                  ),
                                                  count: selector.selectedCount,
                                                );
                                              }
                                              WidgetsHelper.showSnackBar(
                                                context: context,
                                                msg: S.current.addedToCart,
                                              );
                                            },
                                            child: AppLibScreen.appIcon(
                                              icon: Icons.shopping_cart_outlined,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Tooltip(
                                          message: S.current.shareHint,
                                          child: GestureDetector(
                                            onTap: () => Share.share('check out my website https://example.com'),
                                            child: AppLibScreen.appIcon(
                                              icon: Icons.share_outlined,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10,),
                                child: GestureDetector(
                                  onTap: () => favorite.remove(product: favorite.products[index]),
                                  child: Icon(
                                    Icons.close_sharp,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}