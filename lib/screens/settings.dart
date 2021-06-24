import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/screens/languages.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {

  Widget settingOption ({
    @required IconData icon,
    @required String option,
    @required AsyncCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 25, 0, 15,),
      decoration: BoxDecoration(
        border: Border(
          bottom: AppLibScreen.appBorder(),
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
        padding: EdgeInsets.symmetric(horizontal: 20,),
        child: ListView(
          children: [
            const SizedBox(height: 15,),
            settingOption(
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
              icon: Icons.color_lens_outlined,
              option: S.current.theme,
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
              icon: Icons.logout,
              option: S.current.logout,
              onTap: () async {
                bool choiceResult = await WidgetsHelper.choiceDialog(
                  context: context,
                  dialogTitle: S.current.logout,
                  dialogMsg: S.current.logoutMsg,
                );
                if (choiceResult) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(S.current.loggingOut),),
                  );
                  bool logout = await context.read<ConfigNotifier>().logout();
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text( logout
                            ? S.current.logoutSuccessfully
                            : S.current.logoutFailure,
                        ),
                      ),
                    );
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}