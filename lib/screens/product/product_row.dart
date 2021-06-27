import 'package:e_shopping/data/product.dart';
import 'package:e_shopping/screens/product/product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductRow extends StatelessWidget {
  const ProductRow({this.products, this.productType});
  final String? productType;
  final List<Product>? products;

  @override
  Widget build(BuildContext context) {
    List<ProductTile> _productTiles =
    products!.map((p) => ProductTile(product: p)).toList();

    return _productTiles.isEmpty
        ? SizedBox.shrink()
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
          child: Text(
            productType!,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 205,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 18),
            itemCount: _productTiles.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => _productTiles[index],
            separatorBuilder: (_, index) => SizedBox(
              width: 24,
            ),
          ),
        ),
      ],
    );
  }
}