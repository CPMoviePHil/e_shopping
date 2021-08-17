import 'package:e_shopping/data/product.dart';
import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/favorite.dart';
import 'package:e_shopping/screens/navigation/favorite/favorite_widget.dart';
import 'package:e_shopping/screens/product/product.dart';
import 'package:e_shopping/screens/product/product_image.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProductTile2 extends StatelessWidget {

  const ProductTile2({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemSound.play(SystemSoundType.click);
        Utils.pushScreen(
          context: context,
          screen: ProductScreen(product: product),
        );
      },
      child: Stack(
        children: [
          Column(
            children: [
              ProductImage(product: product),
              SizedBox(
                height: 8,
              ),
              Text(
                product.name!,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.cost.toString()}",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Theme.of(context).accentColor),
                  ),
                  FavoriteWidget(product: product),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}