import 'package:e_shopping/configs/constants.dart';
import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Themes extends StatelessWidget {

  final List<ConfigTheme> configThemes = [
    ConfigTheme(
      themeCode: "lightTheme",
      themeName: S.current.lightTheme,
    ),
    ConfigTheme(
      themeCode: "darkMode",
      themeName: S.current.darkMode,
    ),
  ];

  Widget themeOption ({
    @required BuildContext context,
    @required ConfigTheme theme,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 25, 0, 15,),
      decoration: BoxDecoration(
        border: Border(
          bottom: AppLibScreen.appBorder(
            context: context,
          ),
        ),
      ),
      child: Consumer<ConfigNotifier>(
        builder: (context, config, child,){
          return GestureDetector(
            onTap: () async {
              if (context.read<ConfigNotifier>().currentThemeCode != theme.themeCode) {
                config.setTheme(themeCode: theme.themeCode,);
                WidgetsHelper.showSnackBar(
                  context: context,
                  msg: S.current.settingTheme(theme.themeName),
                );
                await Future.delayed(Duration(microseconds: 1200,));
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 3);
              } else {
                WidgetsHelper.showSnackBar(
                  context: context,
                  msg: S.current.settingThemeAlert(theme.themeName),
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppLibScreen.appText(
                  text: theme.themeName,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppLibScreen.pageWidget(
      context: context,
      pageName: S.current.theme,
      page: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,),
        child: ListView(
          children: configThemes.map((e) => themeOption(
            theme: e,
            context: context,
          ),).toList(),
        ),
      ),
    );
  }
}