import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/cart_notifier.dart';
import 'package:e_shopping/screens/order/order.dart';
import 'package:e_shopping/screens/order/order_item.dart';
import 'package:e_shopping/screens/product/call_action.dart';
import 'package:e_shopping/screens/product/product_image.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/widgets_helper.dart';
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
    required Order order,
  }) {
    return GestureDetector(
      onTap: title == S.current.size ? () async => await showSizeSheets(
        order: order,
      ) : () async => await showCountSheets(
        order: order,
      ),
      child: Container(
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3,)),
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
      ),
    );
  }

  Future<void> showCountSheets ({
    required Order order,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            height: 10 * 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      AppLibScreen.appText(
                        text: S.current.countHint,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      10, (index) {
                      return selectCount(
                        order: order,
                        index: index,
                        currentCount: order.count,
                      );
                    },).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget selectCount ({
    required Order order,
    required int index,
    required int currentCount,
  }) {
    return GestureDetector(
      onTap: () {
        print(currentCount);
        print(index+1);
        if (currentCount != index + 1) {
          context.read<CartNotifier>().changeCount(order: order, count: index + 1,);
        }
        Navigator.of(context).pop();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5,),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppLibScreen.appText(
              text: "${index + 1}",
            ),
            if (currentCount == index + 1)
              AppLibScreen.appIcon(
                icon: Icons.check_sharp,
              ),
          ],
        ),
      ),
    );
  }

  Future<void> showSizeSheets ({
    required Order order,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            height: MediaQuery.of(context).size.height * order.item!.product.sizes!.length / 4  * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      AppLibScreen.appText(
                        text: S.current.sizeHint,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Wrap(
                          runSpacing: 12,
                          spacing: 20,
                          children: order.item!.product.sizes!.map((e) => WidgetsHelper.sizeItem(
                            context: context,
                            onTap: () {
                              if (e != order.item!.selectedSize) {
                                context.read<CartNotifier>().changeSize(
                                  oldOrderItem: order.item!,
                                  newOrderItem: OrderItem(
                                    product: order.item!.product,
                                    selectedSize: e,
                                    selectedColor: null,
                                  ),
                                );
                              }
                              Navigator.of(context).pop();
                            },
                            isSelected: e == order.item!.selectedSize,
                            size: e,
                          ),).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
            order: order,
          ),
          choiceSheet(
            title: S.current.count,
            value: "${order.count}",
            order: order,
          ),
        ],
      );
    }
    return choiceSheet(
      title: S.current.count,
      value: "${order.count}",
      order: order,
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
                  Text(
                    "\$" + order.item!.product.cost.toString(),
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Theme.of(context).accentColor,
                    ),
                  )
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