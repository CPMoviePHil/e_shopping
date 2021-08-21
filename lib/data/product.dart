import 'package:equatable/equatable.dart';

import 'category.dart';

class Product extends Equatable {

  late final int productID;
  late final String? name;
  late final List<String>? imageUrls;
  late final double? cost;
  late final List<String>? sizes;

  late final Category? category;
  late final String? productType;

  Product({
    required this.productID,
    this.name,
    this.imageUrls,
    this.cost,
    this.sizes,
    this.category,
    this.productType,
  });

  Product.fromJson(Map<String, dynamic> json){
    productID = json['productID'];
    name = json['name'];
    imageUrls = List.castFrom<dynamic, String>(json['imageUrls']);
    cost = json['cost'];
    category = Category.fromJson(json["category"]);
    productType = json['productType'];
    sizes = json['sizes'] == null ? null : List.castFrom<dynamic, String>(json['sizes']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = {};
    _data['productID'] = productID;
    _data['name'] = name;
    _data['imageUrls'] = imageUrls;
    _data['cost'] = cost;
    _data['category'] = category;
    _data['productType'] = productType;
    _data['sizes'] = sizes;
    return _data;
  }

  @override
  List<Object?> get props => [productID, name, imageUrls, cost, sizes, category, productType,];
}
