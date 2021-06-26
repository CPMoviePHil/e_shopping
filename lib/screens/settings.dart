import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/screens/languages.dart';
import 'package:e_shopping/screens/themes.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {

  Widget settingOption ({
    @required BuildContext context,
    @required IconData icon,
    @required String option,
    @required AsyncCallback onTap,
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
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon),
            const SizedBox(width: 13,),
            AppLibScreen.appText(text: option,),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppLibScreen.pageWidget(
      context: context,
      pageName: S.current.setting,
      page: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        child: ListView(
          children: [
            const SizedBox(height: 15,),
            settingOption(
              context: context,
              icon: Icons.language,
              option: S.current.language,
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Languages(),
                  ),
                );
              },
            ),
            settingOption(
              context: context,
              icon: Icons.color_lens_outlined,
              option: S.current.theme,
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Themes(),
                  ),
                );
              },
            ),
            Consumer<ConfigNotifier>(
              builder: (context, config, child,) {
                return settingOption(
                  context: context,
                  icon: Icons.logout,
                  option: S.current.logout,
                  onTap: () async {
                    bool choiceResult = await WidgetsHelper.choiceDialog(
                      context: context,
                      dialogTitle: S.current.logout,
                      dialogMsg: S.current.logoutMsg,
                    );
                    if (choiceResult == null) {
                      choiceResult = false;
                    }
                    if (choiceResult) {
                      WidgetsHelper.showSnackBar(
                        context: context,
                        msg: S.current.loggingOut,
                      );
                      bool logout = await config.logout();
                      if (logout) {
                        config.setViewStatusToDefault();
                        await config.setLanguageToDefault();
                        await config.setThemeToDefault();
                        WidgetsHelper.showSnackBar(
                          context: context,
                          msg: S.current.logoutSuccessfully,
                        );
                        Navigator.of(context).pop();
                      } else {
                        WidgetsHelper.showSnackBar(
                          context: context,
                          msg: S.current.logoutFailure,
                        );
                      }
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}