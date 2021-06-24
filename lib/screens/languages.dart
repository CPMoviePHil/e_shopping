import 'package:e_shopping/configs/constants.dart';
import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Languages extends StatelessWidget {

  Widget languageOption ({
    @required Locale locale,
  }) {
    ConfigLanguage lang = kLanguages.firstWhere((element) =>
    element.languageCode == locale.languageCode && element.countryCode == locale.countryCode,);
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 25, 0, 15,),
      decoration: BoxDecoration(
        border: Border(
          bottom: AppLibScreen.appBorder(),
        ),
      ),
      child: Consumer<ConfigNotifier>(
        builder: (context, config, child,){
          return GestureDetector(
            onTap: () async {
              config.changeLanguage(locale: locale);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: AppLibScreen.appText(
                    text: lang.afterChangeMsg,
                    fontColor: Colors.white,
                  ),
                ),
              );
              await S.load(locale);
              await Future.delayed(Duration(microseconds: 1200,));
              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= 3);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppLibScreen.appText(
                  text: lang.lang,
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
      pageName: S.current.language,
      page: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,),
        child: ListView(
          children: S.delegate.supportedLocales.map((e) => languageOption(locale: e,),).toList(),
        ),
      ),
    );
  }
}