import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeftList extends StatelessWidget {

  final List<LeftBarItems> leftBarItems = [
    LeftBarItems(icon: Icons.shopping_bag_outlined, leftBarItemsName: "熱門商品", routes: '',),
    LeftBarItems(icon: Icons.collections_outlined, leftBarItemsName: "收藏商品", routes: '',),
    LeftBarItems(icon: Icons.notifications_outlined, leftBarItemsName: "訊息通知", routes: '',),
    LeftBarItems(icon: Icons.info_outline, leftBarItemsName: "最新消息", routes: '',),
    LeftBarItems(icon: Icons.shopping_cart_outlined, leftBarItemsName: "紀錄中心", routes: '',),
    LeftBarItems(icon: Icons.person_outline, leftBarItemsName: "個人資料", routes: '',),
    LeftBarItems(icon: Icons.chat_outlined, leftBarItemsName: "客服中心", routes: '',),
  ];

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


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: personalProfile(),
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: AppLibScreen.leftBarList(leftBarItems: leftBarItems),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}