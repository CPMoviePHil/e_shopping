import 'package:e_shopping/data/product.dart';
import 'package:flutter/cupertino.dart';

class OrderItem {
  Product product;

  /// Selected size of product; This can be null
  String selectedSize;

  /// Selected color of product; This can be null
  String selectedColor;

  OrderItem({@required this.product, this.selectedSize, this.selectedColor});
}