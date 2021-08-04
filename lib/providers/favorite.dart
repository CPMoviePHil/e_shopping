import 'package:e_shopping/data/product.dart';
import 'package:flutter/cupertino.dart';

class FavoriteProvider with ChangeNotifier {
  List<Product> products = [];

  void add({required Product product}) {
    if (!products.contains(product)) {
      products.add(product);
      notifyListeners();
    }
  }
  void remove({required Product product}) {
    if (products.contains(product)) {
      products.remove(product);
      notifyListeners();
    }
  }
}