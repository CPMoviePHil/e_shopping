import 'package:e_shopping/data/product.dart';
import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/favorite.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FavoriteWidget extends StatelessWidget {

  final Product product;

  const FavoriteWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, favorite, child,) {
        if (favorite.products.contains(product)) {
          return AppLibScreen.favoriteWidget(
            context: context,
            message: S.current.removeFromFavorite,
            onTap: () => favorite.remove(product: product),
            isAdded: true,
          );
        } else {
          return AppLibScreen.favoriteWidget(
            context: context,
            message: S.current.addToFavorite,
            onTap: () => favorite.add(product: product),
            isAdded: false,
          );
        }
      },
    );
  }
}