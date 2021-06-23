import 'package:e_shopping/configs/constants.dart';
import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/providers/login_notifier.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login.dart';
import 'models.dart';

class LeftList extends StatelessWidget {

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
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          height: 150,
          width: 150,
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
    return Consumer<ConfigNotifier>(
      builder: (context, config, _config,) {
        return AppLibScreen.appText(
          text: config.currentUser.userName,
          textSize: "large",
          fontColor: Colors.white,
        );
      },
    );
  }

  Widget loginAccount() {
    return Consumer<ConfigNotifier>(
      builder: (context, config, _config,) {
        return AppLibScreen.appText(
          text: "@${config.currentUser.account}",
          textSize: "small",
          fontColor: Colors.white,
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
                      bottom: AppLibScreen.appBorder(),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20,),
                        child: AppLibScreen.appText(text: "訪客，你好!"),
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
              color: Colors.white,
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
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: AppLibScreen.appBorder(),
                    ),
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          bool choiceResult = await WidgetsHelper.choiceDialog(
                            context: context,
                            dialogTitle: "登出",
                            dialogMsg: "確定登出此裝置嗎?",
                          );
                          if (choiceResult) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("登出中.."),));
                            bool logout = await context.read<ConfigNotifier>().logout();
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  content: Text( logout? "已成功登出!" : "登出失敗",),
                                ),
                              );
                            Navigator.of(context).pop();
                          }
                        },
                        child: AppLibScreen.appText(
                          text: "登出",
                        ),
                      ),
                      GestureDetector(
                        onTap: null,
                        child: AppLibScreen.appText(
                          text: "設定",
                        ),
                      ),
                    ],
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