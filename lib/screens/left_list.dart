import 'package:e_shopping/configs/constants.dart';
import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/providers/login_notifier.dart';
import 'package:e_shopping/screens/settings.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login.dart';
import 'models.dart';

import 'package:e_shopping/generated/l10n.dart';

class LeftList extends StatelessWidget {

  final List<LeftBarItem> leftBarItems = [
    LeftBarItem(
      icon: Icons.shopping_bag_outlined,
      leftBarItemsName: S.current.hotProduct,
    ),
    LeftBarItem(
      icon: Icons.collections_outlined,
      leftBarItemsName: S.current.productCollections,
    ),
    LeftBarItem(
      icon: Icons.history_outlined,
      leftBarItemsName: S.current.shoppingHistory,
    ),
    LeftBarItem(
      icon: Icons.category_outlined,
      leftBarItemsName: S.current.productCategory,
    ),
    LeftBarItem(
      icon: Icons.notifications_outlined,
      leftBarItemsName: S.current.notification,
    ),
    LeftBarItem(
      icon: Icons.info_outline,
      leftBarItemsName: S.current.latestNews,
    ),
    LeftBarItem(
      icon: Icons.shopping_cart_outlined,
      leftBarItemsName: S.current.cart,
    ),
    LeftBarItem(
      icon: Icons.person_outline,
      leftBarItemsName: S.current.personalInfo,
    ),
    LeftBarItem(
      icon: Icons.chat_outlined,
      leftBarItemsName: S.current.customerService,
    ),
  ];

  final List<LeftBarItem> visitorLeftBarItems = [
    LeftBarItem(
      icon: Icons.shopping_bag_outlined,
      leftBarItemsName: S.current.hotProduct,
    ),
    LeftBarItem(
      icon: Icons.info_outline,
      leftBarItemsName: S.current.latestNews,
    ),
    LeftBarItem(
      icon: Icons.chat_outlined,
      leftBarItemsName: S.current.customerService,
    ),
  ];

  final LeftBarItem loginLeftBarItem = LeftBarItem(
    icon: Icons.login,
    leftBarItemsName: S.current.login,
  );

  final LeftBarItem settingLeftBarItem = LeftBarItem(
    icon: Icons.settings,
    leftBarItemsName: S.current.setting,
  );

  Widget personalProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        loginProfile(),
        loginName(),
        loginAccount(),
      ],
    );
  }

  Widget loginProfile() {
    return Consumer<ConfigNotifier>(
      builder: (context, config, _config,) {
        return GestureDetector(
          onTap: () async {
            await WidgetsHelper.imageViewerDialog(
              context: context,
              path: config.currentUser!.profile,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            height: 150,
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: AppLibScreen.imageContent(
                imageOnePath: config.currentUser!.profile!,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget loginName() {
    return Consumer<ConfigNotifier>(
      builder: (context, config, _config,) {
        return AppLibScreen.appText(
          text: config.currentUser!.userName,
          textSize: "large",
        );
      },
    );
  }

  Widget loginAccount() {
    return Consumer<ConfigNotifier>(
      builder: (context, config, _config,) {
        return AppLibScreen.appText(
          text: "@${config.currentUser!.account}",
          textSize: "small",
        );
      },
    );
  }

  Widget leftBarItemWidget({
    required BuildContext context,
    required LeftBarItem item,
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
    List<Widget> barLists = <Widget>[];
    Widget listViewSpace = const SizedBox(height: 10,);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Consumer<ConfigNotifier>(
            builder: (context, config, _,) {
              if (config.currentStatus == ViewStatus.visitor) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: AppLibScreen.appBorder(
                        context: context,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20,),
                        child: AppLibScreen.appText(text: S.of(context).visitorGreeting,),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                              create: (context) => LoginNotifier(),
                              child: Login(),
                            ),
                          ),
                        ),
                        child: leftBarItemWidget(
                          context: context,
                          item: loginLeftBarItem,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          Consumer<ConfigNotifier>(
            builder: (context, config, _,) {
              if (config.currentStatus == ViewStatus.visitor) {
                return Container();
              } else {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,),
                  child: personalProfile(),
                );
              }
            },
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Consumer<ConfigNotifier>(
              builder: (context, config, _,) {
                if (config.currentStatus == ViewStatus.visitor) {
                  barLists.add(listViewSpace);
                  barLists.addAll(visitorLeftBarItems.map((e) => leftBarItemWidget(
                    context: context, item: e,
                  )).toList(),);
                  barLists.add(listViewSpace);
                } else {
                  barLists.add(listViewSpace);
                  barLists.addAll(leftBarItems.map((e) => leftBarItemWidget(
                    context: context, item: e,
                  )).toList(),);
                  barLists.add(listViewSpace);
                }
                return Column(
                  children: barLists,
                );
              },
            ),
          ),
          Consumer<ConfigNotifier>(
            builder: (context, config, _,) {
              if (config.currentStatus == ViewStatus.visitor) {
                return Container(
                  color: Colors.white,
                );
              } else {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Settings(),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: AppLibScreen.appBorder(
                          context: context,
                        ),
                      ),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    child: leftBarItemWidget(
                      context: context,
                      item: settingLeftBarItem,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}