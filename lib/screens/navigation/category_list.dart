import 'package:e_shopping/screens/category/category_tile.dart';
import 'package:flutter/cupertino.dart';

import '../../temp_data.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EdgeInsets listViewPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 24);
    return ListView(
      padding: listViewPadding,
      children: [
        CategoryTile(
          imageUrl: manLookRightImageUrl,
          category: menCategory,
          imageAlignment: Alignment.topCenter,
        ),
        SizedBox(height: 16),
        CategoryTile(
          imageUrl: womanLookLeftImageUrl,
          category: womenCategory,
          imageAlignment: Alignment.topCenter,
        ),
        SizedBox(height: 16),
        CategoryTile(
          imageUrl: dogImageUrl, // TODO: Replace with your own image
          category: petCategory,
        ),
      ],
    );
  }
}