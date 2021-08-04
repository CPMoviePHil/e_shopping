import 'dart:ui';

import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageViewer extends StatelessWidget {

  final String? imagePath;
  final List<String>? images;
  final int? initialPage;
  final CarouselController buttonCarouselController = CarouselController();

  ImageViewer({
    Key? key,
    required this.imagePath,
    required this.images,
    required this.initialPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget showImage;
    if (images != null) {
      showImage = Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CarouselSlider(
          items: images!.map((e) => ImageContent(imagePath: e,),).toList(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: false,
            initialPage: this.initialPage!,
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1,
          ),
        ),
      );
    } else {
      showImage = Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          child: ImageContent(
            imagePath: imagePath,
          ),
        ),
      );
    }
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Stack(
          children: [
            Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: showImage,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width * 0.1 - 20 / 2,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: AppLibScreen.appIcon(
                    icon: Icons.close,
                    iconColor: Colors.black,
                    iconSize: "large",
                  ),
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
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.1,),
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
            color: Colors.white,
          ),
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