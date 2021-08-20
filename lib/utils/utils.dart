import 'package:e_shopping/data/product.dart';
import 'package:e_shopping/providers/browsed_history_provider.dart';
import 'package:e_shopping/screens/product/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Utils {

  static void pushScreen({required BuildContext context, required Widget screen}) {
    ThemeData themeData = Theme.of(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Theme(data: themeData, child: screen),
      ),
    );
  }

  static outOfScreen({required BuildContext context,}) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> pushToProductDetail ({
    required BuildContext context,
    required Product product,
  }) async {
    context.read<BrowsedHistoryProvider>().addToHistory(product: product);
    Utils.pushScreen(
      context: context,
      screen: ProductLoader(product: product),
    );
  }
  
}