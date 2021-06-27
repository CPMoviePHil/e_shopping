
import 'package:e_shopping/providers/search_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../category_list.dart';
import '../product_list.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (context.watch<SearchNotifier>().searchString.isNotEmpty) {
      return ProductList();
    } else {
      return CategoryList();
    }
  }
}