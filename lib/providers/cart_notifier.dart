import 'package:e_shopping/screens/order/order_item.dart';
import 'package:flutter/cupertino.dart';

class CartNotifier with ChangeNotifier {
  List<OrderItem> itemsInCart = [];

  double get totalCost {
    double total = 0;
    itemsInCart.forEach((item) {
      total += item.product.cost;
    });
    return total;
  }

  void add(OrderItem orderItem) {
    itemsInCart.add(orderItem);
    notifyListeners();
  }

  void remove(OrderItem orderItem) {
    print(orderItem.product.name);
    var t = itemsInCart.remove(orderItem);
    print(t);
    notifyListeners();
  }
}