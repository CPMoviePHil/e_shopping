import 'package:e_shopping/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

enum ViewStatus { user, visitor, }

class ConfigLanguage {
  final String countryCode;
  final String languageCode;
  final String lang;
  final String alertMsg;
  final String afterChangeMsg;

  const ConfigLanguage({
    @required this.languageCode,
    @required this.countryCode,
    @required this.lang,
    @required this.alertMsg,
    @required this.afterChangeMsg,
  });
}
class ConfigTheme {
  final String themeCode;
  final String themeName;

  const ConfigTheme({
    @required this.themeCode,
    @required this.themeName,
  });
}

const List<ConfigLanguage> kLanguages = [
  ConfigLanguage(
    countryCode: "TW",
    languageCode: "zh",
    lang: "繁體中文(TW)",
    alertMsg: "現在已經是繁體中文",
    afterChangeMsg: "語系跟改成繁體中文",
  ),
  ConfigLanguage(
    countryCode: null,
    languageCode: "en",
    lang: "English",
    alertMsg: "Language already is english",
    afterChangeMsg: "language set to be english",
  ),
];