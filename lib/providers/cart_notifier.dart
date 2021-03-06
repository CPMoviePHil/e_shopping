import 'package:e_shopping/screens/order/order.dart';
import 'package:e_shopping/screens/order/order_item.dart';
import 'package:flutter/cupertino.dart';

class CartNotifier with ChangeNotifier {

  List<Order> cartItems = [];

  double get totalCost {
    double total = 0;
    cartItems.forEach((order){
      total += order.item!.product.cost! * order.count;
    });
    return total;
  }
  
  bool cartContainOrder ({required OrderItem item}) {
    for(int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].item == item) {
        return true;
      }
    }
    return false;
  }

  void changeSize ({
    required OrderItem oldOrderItem,
    required OrderItem newOrderItem,
  }) {
    final Order oldOrder = cartItems.firstWhere((element) => element.item == oldOrderItem);
    if (cartContainOrder(item: newOrderItem)) {
      final index = cartItems.indexWhere((element) => element.item == newOrderItem);
      cartItems[index] = cartItems[index].copyWith(
        count: cartItems[index].count + oldOrder.count,
        item: cartItems[index].item,
      );
    } else {
      cartItems.add(
        Order(
          orderID: cartItems.last.orderID + 1,
          count: oldOrder.count,
          item: newOrderItem,
        ),
      );
    }
    cartItems.remove(oldOrder);
    notifyListeners();
  }

  void changeCount ({required Order order, required int count,}) {
    final index = cartItems.indexWhere((element) => element == order);
    cartItems[index] = cartItems[index].copyWith(
      count: count,
      item: cartItems[index].item,
    );
    notifyListeners();
  }

  void add({
    required OrderItem orderItem,
    int? count,
  }) {
    if (cartContainOrder(item: orderItem)) {
      final index = cartItems.indexWhere((element) => element.item == orderItem);
      cartItems[index] = cartItems[index].copyWith(
        count: cartItems[index].count + 1,
        item: cartItems[index].item,
      );
    } else {
      int orderID;
      if (cartItems.isEmpty) {
        orderID = 1;
      } else {
        orderID = cartItems.last.orderID + 1 ;
      }
      cartItems.add(
        Order(
          orderID: orderID,
          count: count ?? 1,
          item: orderItem,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Order order) {
    cartItems.remove(order);
    notifyListeners();
  }
}