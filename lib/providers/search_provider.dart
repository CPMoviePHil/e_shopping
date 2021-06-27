import 'package:flutter/cupertino.dart';

class SearchNotifier with ChangeNotifier {
  String searchString = '';
  bool sortByPrice = true;
  int priceSort = 0; //0,1

  void changeString ({required String search,}) {
    if (searchString != search) {
      searchString = search;
      notifyListeners();
    }
  }

  void changePriceSort ({required int sort,}) {
    if (priceSort == sort){
      priceSort = sort;
      notifyListeners();
    }
  }
}