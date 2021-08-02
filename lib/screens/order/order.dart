import 'package:e_shopping/screens/order/order_item.dart';

class Order {
  final int orderID;
  final int count;
  final OrderItem? item;

  const Order({required this.orderID, required this.count, required this.item,});

  Order copyWith({
    required int? count,
    required OrderItem? item,
  }) {
    return Order(
      orderID: this.orderID,
      count: count ?? this.count,
      item: item ?? this.item,
    );
  }
}