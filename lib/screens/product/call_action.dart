import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CallToActionButton extends StatelessWidget {
  const CallToActionButton({
    this.onPressed,
    this.labelText,
    this.minSize = const Size(266, 45),
  });
  final Function? onPressed;
  final String? labelText;
  final Size minSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).highlightColor,
        minimumSize: minSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Text(
        labelText!,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}