import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/images_viewer.dart';
import 'package:flutter/material.dart';

class WidgetsHelper {
  static Future<bool> choiceDialog ({
    @required BuildContext context,
    @required String dialogTitle,
    @required String dialogMsg,
  }) async {
    return showDialog(
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
                    onPressed: () => Navigator.of(context).pop(false),
                    child: AppLibScreen.appText(
                      text: S.current.cancel,
                      fontColor: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: AppLibScreen.appText(
                      text: S.current.ok,
                      fontColor: Colors.white,
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
    @required BuildContext context,
    @required String path,
  }) {
    return showDialog(
      context: context,
      builder: (context) => ImageViewer(imagePath: path,),
    );
  }
}