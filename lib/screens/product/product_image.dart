import 'package:e_shopping/configs/theme/colors.dart';
import 'package:e_shopping/data/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .95,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).primaryColor,
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          product.imageUrls!.first,
          loadingBuilder: (_, child, loadingProgress) => loadingProgress == null
              ? child
              : Center(child: CircularProgressIndicator()),
          color: Theme.of(context).primaryColor,
          colorBlendMode: BlendMode.multiply,
        ),
      ),
    );
  }
}