import 'package:e_shopping/configs/constants.dart';
import 'package:e_shopping/data/product.dart';
import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/providers/search_provider.dart';
import 'package:e_shopping/screens/cart/appbar.dart';
import 'package:e_shopping/screens/category/category_tile.dart';
import 'package:e_shopping/screens/product/product_tile.dart';
import 'package:e_shopping/screens/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../temp_data.dart';
import '../left_list.dart';

class HomeScreen extends StatefulWidget {
  @override _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

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
    return InkWell(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => scaffoldKey.currentState!.openDrawer(),
            child: const Icon(Icons.menu),  // add custom icons also),
          ),
          title: SearchBar(),
          actions: [
            CartAppBarAction(),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: context.watch<ConfigNotifier>().currentStatus == ViewStatus.visitor
                ? Colors.white
                : Theme.of(context).primaryColor,
            width: MediaQuery.of(context).size.width * 0.7,
            child: SafeArea(
              child: Container(
                height: double.infinity,
                child: LeftList(),
              ),
            ),
          ),
        ),
        key: scaffoldKey,
        body: (context.watch<SearchNotifier>().searchString.isNotEmpty) ?
        GridView.count(
          padding: listViewPadding,
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          childAspectRatio: .78,
          children: searchResultTiles,
        ) :
        ListView(
          padding: listViewPadding,
          children: [
            CategoryTile(
              imageUrl: manLookRightImageUrl,
              category: menCategory,
              imageAlignment: Alignment.topCenter,
            ),
            SizedBox(height: 16),
            CategoryTile(
              imageUrl: womanLookLeftImageUrl,
              category: womenCategory,
              imageAlignment: Alignment.topCenter,
            ),
            SizedBox(height: 16),
            CategoryTile(
              imageUrl: dogImageUrl, // TODO: Replace with your own image
              category: petCategory,
            ),
          ],
        ),
      ),
    );
  }
}