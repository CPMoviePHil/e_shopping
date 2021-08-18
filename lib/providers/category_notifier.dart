import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_shopping/temp_data.dart';
import 'package:flutter/cupertino.dart';

class CategoryNotifier with ChangeNotifier {

  ImageProvider? firstProvider;
  ImageProvider? secondProvider;
  ImageProvider? thirdProvider;

  void preloadImages({
    required BuildContext context,
    required int cateID,
  }) {
    switch (cateID) {
      case 1:
        firstProvider = CachedNetworkImageProvider(
          menLookRightImageUrl,
        );
        precacheImage(firstProvider!, context);
        break;
      case 2:
        secondProvider = CachedNetworkImageProvider(
          womenLookLeftImageUrl,
        );
        precacheImage(secondProvider!, context);
        break;
      case 3:
        thirdProvider = CachedNetworkImageProvider(
          petsImageUrl,
        );
        precacheImage(thirdProvider!, context);
        break;
    }
  }

}