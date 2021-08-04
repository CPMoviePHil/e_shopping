import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CartActionButton extends StatelessWidget {

  const CartActionButton({
    required this.labelText,
    this.minSize = const Size(266, 45),
    required this.onTap,
    required this.decoration,
    required this.fontColor,
  });

  final VoidCallback onTap;
  final String? labelText;
  final Size minSize;
  final BoxDecoration decoration;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10,),
        decoration: decoration,
        child: Text(
          labelText!,
          style: TextStyle(
            fontSize: 16,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}