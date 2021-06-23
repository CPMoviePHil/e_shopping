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
                    child: Text("取消"),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text("確認"),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}