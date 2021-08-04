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
            vertical: 18,
          ),
          child: Text(
            productType!,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _productTiles.map((e) => SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: e,
              ),).toList(),
            ),
          ),
        ),
      ],
    );
  }
}