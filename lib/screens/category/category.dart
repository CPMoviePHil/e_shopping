import 'package:e_shopping/data/category.dart';
import 'package:e_shopping/data/product.dart';
import 'package:e_shopping/screens/cart/appbar.dart';
import 'package:e_shopping/screens/product/product_row.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../temp_data.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({this.category});
  final Category? category;

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

enum Filters { popular, recent, sale }

class _CategoryScreenState extends State<CategoryScreen> {
  Category? get category => widget.category;
  //Filters filterValue = Filters.popular;
  //String selection;
  late List<Product> _products;

  @override
  void initState() {
    //selection = category.selections?.first;
    _products = products.where((p) => p.category == category).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductRow> productRows = category!.selections!
        .map((s) => ProductRow(
      productType: s,
      products: _products
          .where((p) => p.productType!.toLowerCase() == s.toLowerCase())
          .toList(),
    )).toList();
    return DefaultTabController(
      length: productRows.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AppLibScreen.appText(
            text: category!.title,
            fontColor: Theme.of(context).accentColor,
          ),
          actions: [
            CartAppBarAction(),
          ],
          bottom: TabBar(
            tabs: productRows.map((e) => Tab(
              text: e.productType,
            )).toList(),
          ),
        ),
        body: TabBarView(
          children: productRows,
        ),
      ),
    );
  }
}