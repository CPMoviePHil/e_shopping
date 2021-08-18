import 'package:e_shopping/configs/theme/colors.dart';
import 'package:e_shopping/data/category.dart';
import 'package:e_shopping/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category.dart';

class CategoryTile extends StatelessWidget {

  final ImageProvider cateImageProvider;
  final Category category;
  final Alignment imageAlignment;

  const CategoryTile({
    required this.category,
    required this.cateImageProvider,
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
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: cateImageProvider,
                  fit: BoxFit.cover,
                ),
                color: kGreyBackground,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                category.title.toUpperCase(),
                style: Theme.of(context).textTheme.headline4!.copyWith(
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