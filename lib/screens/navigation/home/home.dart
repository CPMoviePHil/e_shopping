import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shopping/configs/theme/colors.dart';
import 'package:e_shopping/screens/product/product_tile_2.dart';
import 'package:e_shopping/temp_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final List<String> banners = [
    "assets/images/banner_1.jpg",
    "assets/images/banner_2.jpg",
    "assets/images/banner_3.jpg",
    "assets/images/banner_4.jpg",
  ];
  
  final CarouselController carouselController = CarouselController();

  Widget bannerWidget ({
    required BuildContext context,
    required bool isFromPath,
    required String path,
  }) {
    if (isFromPath) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          border: Border(
            top: BorderSide(
              width: 0.5,
              color: kGrey400,
            ),
            bottom: BorderSide(
              width: 0.5,
              color: kGrey400,
            ),
          ),
        ),
        child: Image.asset(
          path,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: CarouselSlider(
              items: banners.map((e) => bannerWidget(
                context: context,
                isFromPath: true,
                path: e,
              ),).toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                autoPlay: false,
                viewportFraction: 1.0,
                initialPage: 1,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 10,
                children: recommendProducts.map((e) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ProductTile2(
                      product: e,
                    ),
                  );
                },).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}