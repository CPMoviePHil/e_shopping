import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/images_viewer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetsHelper {

  static Future<bool?> choiceDialog ({
    required BuildContext context,
    required String dialogTitle,
    required String dialogMsg,
  }) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(dialogTitle),
          content: Text(dialogMsg),
          actions: [
            Container(
              padding: const EdgeInsets.fromLTRB(24.0, 15.0, 15.0, 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Theme.of(context).highlightColor,
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                    child: AppLibScreen.appText(
                      text: S.current.cancel,
                    ),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Theme.of(context).highlightColor,
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                    child: AppLibScreen.appText(
                      text: S.current.ok,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> imageViewerDialog ({
    required BuildContext context,
    required String? path,
  }) {
    return showDialog(
      context: context,
      builder: (context) => ImageViewer(
        imagePath: path, initialPage: null, images: null,
      ),
    );
  }

  static void showSnackBar ({
    required BuildContext context,
    required String msg,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            msg,
          ),
        ),
      );
  }

  static void hideSnackBar ({
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar();
  }

  static Widget sizeItem ({
    required BuildContext context,
    required bool isSelected,
    required String size,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: isSelected ?
        BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onSecondary,
        ) : null,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: AppLibScreen.appText(
          text: size,
          fontColor: isSelected
              ? Theme.of(context).primaryColor
              : null,
        ),
      ),
    );
  }

  static DateTime strToDateTime ({required String str}) {
    DateTime dateTime = DateFormat("yyyy-MM-dd hh:mm:ss").parse(str);
    return dateTime;
  }

  static String dateTimeToStr ({
    required DateTime datetime,
    String? format,
  }) {
    String dateTime = "";
    switch (format) {
      case "onlyDate":
        dateTime = DateFormat("yyyy-MM-dd").format(datetime);
        return dateTime;
      case "onlyTime":
        dateTime = DateFormat("hh:mm").format(datetime);
        return dateTime;
      default:
        dateTime = DateFormat("yyyy-MM-dd hh:mm:ss").format(datetime);
        return dateTime;
    }
  }

  static String strToStrTime ({required String datetime,}) {
    final dateTime = strToDateTime(str: datetime);
    return dateTimeToStr(datetime: dateTime, format: "onlyTime",);
  }

  static String strToStrDate ({required String datetime,}) {
    final dateTime = strToDateTime(str: datetime);
    return dateTimeToStr(datetime: dateTime, format: "onlyDate",);
  }
}