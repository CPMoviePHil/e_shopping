import 'package:e_shopping/data/product.dart';
import 'package:e_shopping/providers/search_provider.dart';
import 'package:e_shopping/screens/product/product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../temp_data.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EdgeInsets listViewPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 24);
    List<Widget> searchResultTiles = <Widget>[];
    if (context.watch<SearchNotifier>().searchString != '') {
      if (context.watch<SearchNotifier>().searchString.length != 0) {
        if (context.watch<SearchNotifier>().sortByPrice) {
          late List<Product> productsToSort = products;
          if (context.watch<SearchNotifier>().priceSort == 0) {
            productsToSort.sort((a, b) => a.cost!.compareTo(b.cost!),);
          } else {
            productsToSort.sort((a, b) => b.cost!.compareTo(a.cost!),);
          }
          searchResultTiles = products.where((p)
          => p.name!.toLowerCase().contains(context.watch<SearchNotifier>().searchString.toLowerCase())).map((p)
          => ProductTile(product: p),
          ).toList();
        }
      }
    }
    return GridView.count(
      padding: listViewPadding,
      crossAxisCount: 2,
      mainAxisSpacing: 24,
      crossAxisSpacing: 24,
      childAspectRatio: .78,
      children: searchResultTiles,
    );
  }
}