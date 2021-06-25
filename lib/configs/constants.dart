import 'package:flutter/cupertino.dart';

enum ViewStatus { user, visitor, }

class ConfigLanguage {
  final String countryCode;
  final String languageCode;
  final String lang;
  final String afterChangeMsg;

  const ConfigLanguage({
    @required this.languageCode,
    @required this.countryCode,
    @required this.lang,
    @required this.afterChangeMsg,
  });
}

const List<ConfigLanguage> kLanguages = [
  ConfigLanguage(
    countryCode: "TW",
    languageCode: "zh",
    lang: "繁體中文(TW)",
    afterChangeMsg: "語系跟改成繁體中文",
  ),
  ConfigLanguage(
    countryCode: null,
    languageCode: "en",
    lang: "English",
    afterChangeMsg: "language set to be english",
  ),
];