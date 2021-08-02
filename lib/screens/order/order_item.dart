import 'package:e_shopping/data/product.dart';
import 'package:equatable/equatable.dart';

class OrderItem extends Equatable{
  final Product product;

  /// Selected size of product; This can be null
  final String? selectedSize;

  /// Selected color of product; This can be null
  final String? selectedColor;

  const OrderItem({
    required this.product,
    required this.selectedSize,
    required this.selectedColor,
  });

  @override
  List<Object?> get props => [
    product,
    selectedSize,
    selectedColor,
  ];
}