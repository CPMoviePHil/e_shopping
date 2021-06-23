import 'package:e_shopping/screens/models.dart';
import 'package:flutter/material.dart';

const List<LeftBarItem> leftBarItems = [
  const LeftBarItem(icon: Icons.shopping_bag_outlined, leftBarItemsName: "熱門商品", routes: '',),
  const LeftBarItem(icon: Icons.collections_outlined, leftBarItemsName: "收藏商品", routes: '',),
  const LeftBarItem(icon: Icons.notifications_outlined, leftBarItemsName: "訊息通知", routes: '',),
  const LeftBarItem(icon: Icons.info_outline, leftBarItemsName: "最新消息", routes: '',),
  const LeftBarItem(icon: Icons.shopping_cart_outlined, leftBarItemsName: "紀錄中心", routes: '',),
  const LeftBarItem(icon: Icons.person_outline, leftBarItemsName: "個人資料", routes: '',),
  const LeftBarItem(icon: Icons.chat_outlined, leftBarItemsName: "客服中心", routes: '',),
];

const List<LeftBarItem> visitorLeftBarItems = [
  const LeftBarItem(icon: Icons.shopping_bag_outlined, leftBarItemsName: "熱門商品", routes: '',),
  const LeftBarItem(icon: Icons.info_outline, leftBarItemsName: "最新消息", routes: '',),
  const LeftBarItem(icon: Icons.chat_outlined, leftBarItemsName: "客服中心", routes: '',),
];

const LeftBarItem loginLeftBarItem = const LeftBarItem(icon: Icons.login, leftBarItemsName: "登入", routes: '',);
enum ViewStatus { user, visitor, }