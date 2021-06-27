import 'package:e_shopping/data/product.dart';
import 'package:e_shopping/screens/product/product.dart';
import 'package:e_shopping/screens/product/product_image.dart';
import 'package:e_shopping/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
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
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(product: product),
            SizedBox(
              height: 8,
            ),
            Text(
              product.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Spacer(),
            Text(
              "\$${product.cost.toString()}",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Theme.of(context).accentColor),
            )
          ],
        ),
      ),
    );
  }
}