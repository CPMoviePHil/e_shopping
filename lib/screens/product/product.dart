import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shopping/configs/theme/colors.dart';
import 'package:e_shopping/data/category.dart';
import 'package:e_shopping/data/comment.dart';
import 'package:e_shopping/data/product.dart';
import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/cart_notifier.dart';
import 'package:e_shopping/providers/favorite.dart';
import 'package:e_shopping/screens/cart/appbar.dart';
import 'package:e_shopping/screens/cart/cart.dart';
import 'package:e_shopping/screens/comment/create.dart';
import 'package:e_shopping/screens/comment/product_comments.dart';
import 'package:e_shopping/screens/order/order_item.dart';
import 'package:e_shopping/temp_data.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/images_viewer.dart';
import 'package:e_shopping/utils/utils.dart';
import 'package:e_shopping/utils/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'call_action.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    required this.product,
  });
  final Product product;
  @override _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product get product => widget.product;
  String? selectedImageUrl;
  String? selectedSize;
  bool isPressed = false;
  bool appBarVisible = false;
  double appBarHeight = 0;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    selectedImageUrl = product.imageUrls!.first;
    selectedSize = product.sizes?.first;
    scrollController.addListener(() {
      if (scrollController.position.pixels > 50) {
        if (!appBarVisible) {
          setState(() {
            appBarHeight = 50;
            appBarVisible = true;
          });
        }
      } else {
        if (appBarVisible) {
          setState(() {
            appBarHeight = 0;
            appBarVisible = false;
          });
        }
      }
    },);
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

  void setAddToCart() {
    setState(() {
      isPressed = true;
    });
  }

  List<Product> filterProducts ({required List<Product> products, required Category category,}) {
    return products.where((e) => e.category == category && e.name != widget.product.name,).toList();
  }
  
  Widget pageWidget ({
    required double stars,
    required Widget commentWidget,
  }) {
    return  CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16,),
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .35,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    viewportFraction: 1,
                                    height: MediaQuery.of(context).size.height * .35,
                                  ),
                                  items: product.imageUrls!.map(
                                        (e) {
                                      return GestureDetector(
                                        onTap: () {
                                          if (product.imageUrls!.length > 1) {
                                            showDialog(
                                              context: context,
                                              builder: (context) => ImageViewer(
                                                imagePath: e,
                                                initialPage: product.imageUrls!.indexOf(e),
                                                images: product.imageUrls!,
                                              ),
                                            );
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (context) => ImageViewer(
                                                imagePath: e,
                                                initialPage: null,
                                                images: null,
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          color: Theme.of(context).backgroundColor,
                                          child: Image.network(
                                            e,
                                            fit: BoxFit.cover,
                                            color: kGreyBackground,
                                            colorBlendMode: BlendMode.multiply,
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 0,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: AppLibScreen.appIcon(icon: Icons.arrow_back_sharp),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 16,),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                          ),
                          padding: EdgeInsets.only(left: 11, top: 10, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLibScreen.starsWidget(stars: stars),
                              Tooltip(
                                message: S.current.shareHint,
                                child: GestureDetector(
                                  onTap: () => Share.share('check out my website https://example.com'),
                                  child: AppLibScreen.appIcon(
                                      icon: Icons.share_outlined,
                                      iconSize: "small"
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5,
                                color: kGrey400,
                              ),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                product.name!,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "\$" + product.cost.toString(),
                                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              if (product.sizes != null)
                                Container(
                                  padding: EdgeInsets.only(top: 12,),
                                  child: Row(
                                    children: [
                                      AppLibScreen.appText(text: S.current.size),
                                    ],
                                  ),
                                ),
                              if (product.sizes != null)
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 12,),
                                  child: Wrap(
                                    runSpacing: 12,
                                    spacing: 20,
                                    children: product.sizes!.map((e) => WidgetsHelper.sizeItem(
                                      context: context,
                                      isSelected: e == selectedSize,
                                      size: e,
                                      onTap: () => setSelectedSize(e),
                                    ),).toList(),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Container(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.5,
                                      color: kGrey400,
                                    ),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 15,),
                                      child: Row(
                                        children: [
                                          AppLibScreen.appText(text: S.current.comments),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: kGrey400,
                                      thickness: 0.5,
                                    ),
                                    commentWidget,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget bottomWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Consumer<FavoriteProvider>(
            builder: (context, favorite, child,) {
              if (favorite.products.contains(product)) {
                return AppLibScreen.favoriteWidget(
                  context: context,
                  message: S.current.removeFromFavorite,
                  onTap: () => favorite.remove(product: product),
                  isAdded: true,
                );
              } else {
                return AppLibScreen.favoriteWidget(
                  context: context,
                  message: S.current.addToFavorite,
                  onTap: () => favorite.add(product: product),
                  isAdded: false,
                );
              }
            },
          ),
          Tooltip(
            message: S.current.createComment,
            child: GestureDetector(
              onTap: () => Utils.pushScreen(context: context, screen: CreateComment(product: product)),
              child: AppLibScreen.appIcon(
                icon: Icons.article_outlined,
              ),
            ),
          ),
          CartActionButton(
            labelText: S.current.addToCart,
            onTap: () {
              context.read<CartNotifier>().add(
                OrderItem(
                  product: product,
                  selectedSize: selectedSize,
                  selectedColor: null,
                ),
              );
              WidgetsHelper.showSnackBar(
                context: context,
                msg: S.current.addedToCart,
              );
            },
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
              ),
            ),
            fontColor: Colors.black,
          ),
          CartActionButton(
            labelText: S.current.goToCart,
            onTap: () {
              WidgetsHelper.hideSnackBar(
                context: context,
              );
              Utils.pushScreen(
                context: context,
                screen: CartScreen(),
              );
            },
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
            fontColor: Theme.of(context).backgroundColor,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<CommentModel> productComments = comments.where((element) => element.productID == product.productID).toList();
    Widget commentWidget;
    double stars = 0.0;
    if (productComments.length == 0) {
      commentWidget = Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(vertical: 15,),
        child: AppLibScreen.appText(
          text: S.current.emptyComments,
          fontColor: kGrey600,
        ),
      );
    } else {
      productComments.map((e) {
        stars = stars + e.star;
      },).toList();
      stars = stars / productComments.length;
      commentWidget = ProductCommentsScreen(comments: productComments);
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          centerTitle: true,
          title: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(child: child, scale: animation);
            },
            child: AppLibScreen.appText(text: product.name,),
          ),
          actions: [
            CartAppBarAction(),
          ],
        ),
      ),
      body: pageWidget(stars: stars, commentWidget: commentWidget),
      bottomNavigationBar: bottomWidget(),
    );
  }
}