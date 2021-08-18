import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {

  bool commentsCollapsed = false;

  void collapseComments () {
    commentsCollapsed = !commentsCollapsed;
    notifyListeners();
  }
}