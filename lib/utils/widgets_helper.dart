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

  static Future<CartSelector?> cartDialogWithSizes ({
    required BuildContext context,
    required List<String> sizes,
    required List<int> counts,
  }) async {
    int selectCount = counts.first;
    String selectSize = sizes.first;
    return showDialog<CartSelector?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppLibScreen.appText(
                                text: S.current.sizeHint,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Wrap(
                            spacing: 20,
                            children: sizes.map((e) => WidgetsHelper.sizeItem(
                              context: context,
                              onTap: () {
                                setState(() {
                                  selectSize = e;
                                });
                              },
                              isSelected: e == selectSize,
                              size: e,
                            ),).toList(),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppLibScreen.appText(
                                text: S.current.count,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 12,),
                              child: DropdownButton<int>(
                                value: selectCount,
                                items: counts.map<DropdownMenuItem<int>>((int index) {
                                  return DropdownMenuItem<int>(
                                    value: index,
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 15,),
                                        child: AppLibScreen.appText(text: "$index"),
                                      ),
                                    ),
                                  );},
                                ).toList(),
                                onChanged: (value) {
                                  setState((){
                                    selectCount = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10,),
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                              ),
                              child: AppLibScreen.appText(text: S.current.cancel),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop(
                                CartSelector(
                                  selectedSize: selectSize,
                                  selectedCount: selectCount,
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10,),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5,
                                ),
                              ),
                              child: AppLibScreen.appText(text: S.current.ok),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
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

  static String dateTimeDiffStr ({required DateTime dateTime}) {
    final int days = DateTime.now().difference(dateTime).inDays;
    if (days >= 7 && days <= 30) {
      final double weeks = days / 7;
      return S.current.weeksAgo(weeks.floor(),);
    } else if(days >= 31 && days <= 365) {
      final double months = days / 31;
      return S.current.monthAgo(months.floor(),);
    } else if(days >= 366 ) {
      final double years = days / 365;
      return S.current.yearsAgo(years.floor());
    } else {
      return S.current.daysAgo(days,);
    }
  }
}

class CartSelector {
  final String selectedSize;
  final int selectedCount;

  const CartSelector({
    required this.selectedSize,
    required this.selectedCount,
  });
}