import 'package:e_shopping/configs/constants.dart';
import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models.dart';

class LeftList extends StatelessWidget {

  Widget personalProfile() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          loginProfile(),
          ListTileTheme(
            contentPadding: const EdgeInsets.only(right: 0, left: 0,),
            child: ListTile(
              title: loginName(),
              subtitle: loginAccount(),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginProfile() {
    return Consumer<ConfigNotifier>(
      builder: (context, config, _config,) {
        return Container(
          height: 80,
          width: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: AppLibScreen.imageContent(
              imageOnePath: config.currentUser.profile,
            ),
          ),
        );
      },
    );
  }

  Widget loginName() {
    return Row(
      children: [
        Consumer<ConfigNotifier>(
          builder: (context, config, _config,) {
            return AppLibScreen.appText(
              text: config.currentUser.userName,
              textSize: "large",
            );
          },
        ),
      ],
    );
  }

  Widget loginAccount() {
    return Consumer<ConfigNotifier>(
      builder: (context, config, _config,) {
        return AppLibScreen.appText(
          text: "@${config.currentUser.account}",
          fontColor: Colors.grey,
          textSize: "small",
        );
      },
    );
  }

  Widget leftBarItemWidget({
    @required BuildContext context,
    @required LeftBarItem item,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25,),
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppLibScreen.appIcon(
            icon: item.icon,
            iconSize: "medium",
          ),
          const SizedBox(
            width: 20,
          ),
          AppLibScreen.appText(
            text: item.leftBarItemsName,
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10,),
          child: personalProfile(),
        ),
        //const Divider(thickness: 0.5, color: Colors.black,),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: AppLibScreen.appBorder(),
                  bottom: AppLibScreen.appBorder(),
                ),
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: leftBarItems.map((e) => leftBarItemWidget(
                  context: context, item: e,
                )).toList(),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10,),
          child: GestureDetector(
            onTap: () async {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("登出中.."),));
              bool logout = await context.read<ConfigNotifier>().logout();
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text( logout? "已成功登出!" : "登出失敗",),
                  ),
                );
            },
            child: AppLibScreen.appText(
              text: "登出",
            ),
          ),
        ),
      ],
    );
  }
}