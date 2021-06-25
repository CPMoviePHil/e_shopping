import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppLibScreen {

  static BorderSide appBorder ({
    @required BuildContext context,
    double width = 0.2,
    Color color,
  }) {
    if (color == null) {
      color = Theme.of(context).highlightColor;
    }
    return BorderSide(
      width: width,
      color: color,
    );
  }

  static Widget appIcon ({
    @required IconData icon,
    Color iconColor,
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
        icon,
        color: iconColor,
        size: size,
      ),
    );
  }

  static Widget appText ({
    @required String text,
    Color fontColor,
    String textSize = 'medium',
  }) {
    double fontSize = 18;
    switch(textSize){
      case "large":
        fontSize = 25;
        break;
      case "small":
        fontSize = 13;
        break;
      case "medium":
      default :
        fontSize = 16;
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
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  static InputDecoration inputDecoration ({
    @required String hintText,
    Color fontColor,
    double fontSize = 15,
    IconData suffixIcon,
    VoidCallback suffixIconPress,
  }) {
    if (fontColor == null) {
      fontColor = Colors.grey[200];
    }
    return InputDecoration(
      suffixIcon: suffixIcon != null ?
      IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(suffixIcon,),
        onPressed: suffixIconPress,
      ) : null,
      hintText: hintText,
      hintStyle: TextStyle(
        color: fontColor,
        fontSize: fontSize,
      ),
    );
  }

  static AppBar commonAppBar ({
    @required BuildContext context,
    @required String appBarMsg,
  }) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back,),
        onPressed: () => Navigator.of(context).pop(),
      ),
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      title: AppLibScreen.appText(
        text: appBarMsg,
      ),
    );
  }

  static Widget pageWidget ({
    @required BuildContext context,
    @required String pageName,
    @required Widget page,
  }) {
    return Scaffold(
      appBar: commonAppBar(context: context, appBarMsg: pageName,),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: page,
      ),
    );
  }
}