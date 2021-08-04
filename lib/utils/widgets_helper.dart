import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/images_viewer.dart';
import 'package:flutter/material.dart';

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
      builder: (context) => ImageViewer(imagePath: path,),
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
      borderRadius: const BorderRadius.all(
        Radius.circular(20,),
      ),
      onTap: onTap,
      child: Container(
        decoration: isSelected ?
        BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: const BorderRadius.all(Radius.circular(20,)),
        ) : null,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
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
}