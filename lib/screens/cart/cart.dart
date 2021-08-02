import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/cart_notifier.dart';
import 'package:e_shopping/screens/order/order.dart';
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

  Widget choiceSheet ({
    required String title,
    required String value,
  }) {
    return Container(
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5,)),
        border: Border.all(
          width: 1,
          color: Theme.of(context).accentColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 8,),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLibScreen.appText(
                    text: title,
                    fontColor: Theme.of(context).accentColor,
                  ),
                  SizedBox(height: 10,),
                  AppLibScreen.appText(
                    text: value,
                  ),
                ],
              ),
            ),
          ),
          AppLibScreen.appIcon(
            icon: Icons.arrow_drop_down_sharp,
          ),
        ],
      ),
    );
  }

  Widget sheets ({required Order order,}) {
    if (order.item!.selectedSize != null) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          choiceSheet(
            title: S.current.size,
            value: order.item!.selectedSize!,
          ),
          choiceSheet(
            title: S.current.count,
            value: "${order.count}",
          ),
        ],
      );
    }
    return choiceSheet(
      title: S.current.count,
      value: "${order.count}",
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> orderItemRows = context.watch<CartNotifier>().cartItems
        .map((order) => Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 125,
              child: ProductImage(
                product: order.item!.product,
              ),
            ),
            SizedBox(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      order.item!.product.name!,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: sheets(order: order),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      "\$" + order.item!.product.cost.toString(),
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 18,
              width: 18,
              child: GestureDetector(
                child: Icon(Icons.close, size: 18, color: Colors.red,),
                onTap: () => context.read<CartNotifier>().remove(order),
              ),
            ),
          ],
        )
      ],),
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