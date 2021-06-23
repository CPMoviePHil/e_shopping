import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppLibScreen {

  static BorderSide appBorder({
    double width = 0.2,
    Color color = const Color.fromRGBO(61, 65, 69, 1),
  }) {
    return BorderSide(
      width: width,
      color: color,
    );
  }

  static Widget appIcon ({
    @required IconData icon,
    Color iconColor = Colors.black,
    double size = 20,
    String iconSize = "medium",
  }) {
    switch (iconSize) {
      case "large":
        size = 30;
        break;
      case "small":
        size = 15;
        break;
      case "medium":
        size = 25;
        break;
      default :
        size = 20;
        break;
    }
    return InkWell(
      onTap: null,
      child: Icon (
        icon, color: iconColor, size: size,
      ),
    );
  }

  static Widget appText ({
    @required String text,
    Color fontColor = Colors.black,
    String textSize = 'medium',
  }) {
    double fontSize = 18;
    switch(textSize){
      case "large":
        fontSize = 25;
        break;
      case "small":
        fontSize = 15;
        break;
      case "medium":
      default :
        fontSize = 18;
        break;
    }
    return Text(
      "$text",
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }

  static Widget imageContent ({
    @required String imageOnePath,
  }) {
    return CachedNetworkImage(
      imageUrl: imageOnePath,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}