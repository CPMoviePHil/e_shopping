import 'package:e_shopping/providers/category_notifier.dart';
import 'package:e_shopping/screens/category/category_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../temp_data.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EdgeInsets listViewPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 24);
    return ListView(
      padding: listViewPadding,
      children: [
        CategoryTile(
          cateImageProvider: context.read<CategoryNotifier>().firstProvider!,
          category: menCategory,
          imageAlignment: Alignment.topCenter,
        ),
        SizedBox(height: 16),
        CategoryTile(
          cateImageProvider: context.read<CategoryNotifier>().secondProvider!,
          category: womenCategory,
          imageAlignment: Alignment.topCenter,
        ),
        SizedBox(height: 16),
        CategoryTile(
          cateImageProvider: context.read<CategoryNotifier>().thirdProvider!,
          category: petCategory,
        ),
      ],
    );
  }
}