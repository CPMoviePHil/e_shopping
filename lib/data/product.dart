import 'package:equatable/equatable.dart';

import 'category.dart';

class Product extends Equatable{
  final int productID;
  final String? name;
  final List<String>? imageUrls;
  final double? cost;
  final String? description;
  final List<String>? sizes;

  /// Which overall category this product belongs in. e.g - Men, Women, Pets, etc.
  final Category? category;

  /// Represents type of product such as shirt, jeans, pet treats, etc.
  final String? productType;

  Product({
    required this.productID,
    this.name,
    this.imageUrls,
    this.cost,
    this.description,
    this.sizes,
    this.category,
    this.productType,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [productID, name, imageUrls, cost, description, sizes, category, productType,];
}
