import 'package:e_shopping/screens/product/product_tile_2.dart';
import 'package:e_shopping/temp_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 15,
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