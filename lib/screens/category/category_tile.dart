import 'package:e_shopping/configs/theme/colors.dart';
import 'package:e_shopping/data/category.dart';
import 'package:e_shopping/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category.dart';

class CategoryTile extends StatelessWidget {

  final String imageUrl;
  final Category category;
  final Alignment imageAlignment;

  const CategoryTile({
    @required this.category,
    @required this.imageUrl,
    this.imageAlignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Utils.pushScreen(
        context: context,
        screen: CategoryScreen(
          category: category,
        ),
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              color: kGreyBackground,
              colorBlendMode: BlendMode.darken,
              alignment: imageAlignment,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                category.title.toUpperCase(),
                style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}