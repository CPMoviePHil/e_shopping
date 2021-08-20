import 'dart:convert';

import 'package:e_shopping/data/product.dart';
import 'package:e_shopping/utils/prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BrowsedHistoryProvider with ChangeNotifier {

  List<Product> browsedProducts = [];

  MainPrefs? _prefs;

  Future<void> init() async {
    _prefs = MainPrefs(prefs: await SharedPreferences.getInstance());
    if(_prefs!.getString(key: "browsed_history") != null) {
      print(_prefs!.getString(key: "browsed_history"));
      browsedProducts = json.decode(_prefs!.getString(key: "browsed_history")!) as List<Product>;
    }
  }

  Future<void> addToHistory ({required Product product}) async {
    if(!browsedProducts.contains(product)) {
      browsedProducts.add(product);
      await _prefs!.setString(
        key: "browsed_history",
        value: browsedProducts.toString(),
      );
    }
    print(browsedProducts);
  }

  Future<void> removeHistory () async {
    browsedProducts = [];
    await _prefs!.removeKey(
      key: "browsed_history",
    );
  }
}