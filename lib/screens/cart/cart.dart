import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/cart_notifier.dart';
import 'package:e_shopping/screens/product/call_action.dart';
import 'package:e_shopping/screens/product/product_image.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateState() => setState(() {});

  @override
  Widget build(BuildContext context) {
    List<Widget> orderItemRows = context.watch<CartNotifier>().cartItems
        .map((order) => Row(
        children: [
          SizedBox(
            width: 125,
            child: ProductImage(
              product: order.item!.product,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.item!.product.name!,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                if (order.item!.selectedSize != null)
                  Text(
                    S.current.productSize(order.item!.selectedSize!),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "\$" + order.item!.product.cost.toString(),
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Text(
                  S.current.orderCount(order.count),
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => context.read<CartNotifier>().remove(order),
            color: Colors.red,
          )
        ],
      ),
    ).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Column(
          children: [
            AppLibScreen.appText(
              text: S.current.cart,
              fontColor: Theme.of(context).accentColor,
            ),
            /*AppLibScreen.appText(
              text: S.current.cartItems(context.watch<CartNotifier>().itemsInCart.length),
              fontColor: Theme.of(context).accentColor,
              textSize: "small",
            ),*/
          ],
        ),
      ),
      body: Column(
        children: [
          if (orderItemRows.isNotEmpty)
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                itemCount: orderItemRows.length,
                itemBuilder: (_, index) => orderItemRows[index],
                separatorBuilder: (_, index) => SizedBox(
                  height: 16,
                ),
              ),
            )
          else
            Expanded(
              child: Center(
                child: Text(S.current.emptyCart),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.current.total,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      "\$" + context.watch<CartNotifier>().totalCost.toStringAsFixed(2),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
                CallToActionButton(
                  onPressed: () {},
                  labelText: S.current.checkOut,
                  minSize: Size(220, 45),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}