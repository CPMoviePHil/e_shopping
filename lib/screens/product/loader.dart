import 'package:e_shopping/data/product.dart';
import 'package:e_shopping/providers/product_provider.dart';
import 'package:e_shopping/screens/product/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductLoader extends StatelessWidget {

  final Product product;

  const ProductLoader({required this.product});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child: ProductScreen(
        product: product,
      ),
    );
  }
}