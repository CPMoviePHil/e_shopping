import 'package:e_shopping/configs/theme/colors.dart';
import 'package:e_shopping/data/notification.dart';
import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/temp_data.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {

  Color typeColor ({required BuildContext context, required int type}) {
    switch (type) {
      case 2:
        return kColorRed;
      default:
        return Theme.of(context).buttonColor;
    }
  }

  String typeTitle ({required BuildContext context, required int type}) {
    switch (type) {
      case 2:
        return S.of(context).notificationType2;
      default:
        return S.of(context).notificationType1;
    }
  }

  Widget notificationRow ({
    required BuildContext context,
    required NotificationModel notification,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: kGrey400,),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 15,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            alignment: Alignment.center,
            child: AppLibScreen.appText(
              text: typeTitle(
                context: context,
                type: notification.notificationType,
              ),
              fontColor: typeColor(
                context: context,
                type: notification.notificationType,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLibScreen.appText(
                  text: notification.title,
                ),
                SizedBox(height: 10,),
                AppLibScreen.appText(
                  text: notification.short,
                ),
                SizedBox(height: 10,),
                AppLibScreen.appText(
                  text: notification.createTime,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 5,),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              notificationRow(
                context: context,
                notification: notifications[index],
              ),
              SizedBox(height: 5,),
            ],
          );
        },
      ),
    );
  }
}