import 'dart:math';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shopping/configs/theme/colors.dart';
import 'package:e_shopping/data/category.dart';
import 'package:e_shopping/data/product.dart';
import 'package:e_shopping/providers/cart_notifier.dart';
import 'package:e_shopping/screens/cart/appbar.dart';
import 'package:e_shopping/screens/order/order_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../temp_data.dart';
import 'call_action.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({@required this.product});
  final Product product;

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product get product => widget.product;
  String selectedImageUrl;
  String selectedSize;

  @override
  void initState() {
    selectedImageUrl = product.imageUrls.first;
    selectedSize = product.sizes?.first;
    super.initState();
  }

  void setSelectedImageUrl(String url) {
    setState(() {
      selectedImageUrl = url;
    });
  }

  void setSelectedSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  List<Product> filterProducts ({@required List<Product> products, @required Category category,}) {
    return products.where((e) => e.category == category && e.name != widget.product.name,).toList();
  }

  Widget relatedProductsSlider ({
    @required Category cate,
  }) {
    List<Product> relatedProducts = filterProducts(products: products, category: cate,);
    final int number = Random().nextInt(relatedProducts.length);
    return CarouselSlider(
      options: CarouselOptions(height: 190.0, initialPage: number,),
      items: relatedProducts.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: 190,
                child: Column(
                  children: [
                    Container(
                      child: Image.network(i.imageUrls[0],),
                    ),
                    Container(
                      child: Text(i.name),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imagePreviews = product.imageUrls
        .map(
          (url) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: () => setSelectedImageUrl(url),
          child: Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              border: selectedImageUrl == url
                  ? Border.all(
                  color: Theme.of(context).accentColor, width: 1.75)
                  : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              url,
            ),
          ),
        ),
      ),
    )
        .toList();

    List<Widget> sizeSelectionWidgets = product.sizes
        ?.map(
          (s) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: () {
            setSelectedSize(s);
          },
          child: Container(
            height: 42,
            width: 38,
            decoration: BoxDecoration(
              color: selectedSize == s
                  ? Theme.of(context).accentColor
                  : null,
              border: Border.all(
                color: Colors.grey[350],
                width: 1.25,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                s,
                style: Theme.of(context).textTheme.caption.copyWith(
                    color: selectedSize == s ? Colors.white : null),
              ),
            ),
          ),
        ),
      ),
    )
        ?.toList() ??
        [];

    return Scaffold(
      appBar: AppBar(
        actions: [
          CartAppBarAction(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .35,
            color: kGreyBackground,
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    selectedImageUrl,
                    fit: BoxFit.cover,
                    color: kGreyBackground,
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imagePreviews,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "\$" + product.cost.toString(),
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  SizedBox(height: 12),
                  /*Container(
                    child: relatedProductsSlider(cate: widget.product.category,),
                  ),*/
                  Center(
                    child: CallToActionButton(
                      onPressed: () => context.read<CartNotifier>().add(
                        OrderItem(
                          product: product,
                          selectedSize: selectedSize,
                        ),
                      ),
                      labelText: "Add to Cart",
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}