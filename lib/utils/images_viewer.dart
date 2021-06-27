import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageViewer extends StatelessWidget {

  final String? imagePath;
  final CarouselController buttonCarouselController = CarouselController();

  ImageViewer({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width * 0.25,
                padding: EdgeInsets.only(left: 30,),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppLibScreen.appIcon(
                      icon: Icons.close,
                      iconColor: Colors.white,
                      iconSize: "large",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: ImageContent(
                  imagePath: imagePath,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageContent extends StatelessWidget {

  final String? imagePath;

  ImageContent({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.1,),
        child: PhotoView(
          initialScale: PhotoViewComputedScale.contained * 1,
          minScale: PhotoViewComputedScale.contained * 1,
          imageProvider: CachedNetworkImageProvider(
            imagePath!,
          ),
        ),
      ),
    );
  }
}