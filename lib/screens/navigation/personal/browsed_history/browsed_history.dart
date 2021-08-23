import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/browsed_history_provider.dart';
import 'package:e_shopping/screens/product/product_tile.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrowsedHistoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppLibScreen.appText(text: S.current.browsedHistory,),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5,),
        child: SingleChildScrollView(
          child: Consumer<BrowsedHistoryProvider>(
            builder: (context, browsed, child) {
              return Container(
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: browsed.browsedProducts.map((e) => SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: ProductTile(
                      product: e,
                    ),
                  ),).toList(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}