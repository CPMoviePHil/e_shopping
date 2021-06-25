import 'package:e_shopping/configs/constants.dart';
import 'package:e_shopping/configs/theme/index.dart';
import 'package:e_shopping/data/user.dart';
import 'package:e_shopping/utils/prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigNotifier with ChangeNotifier {

  ViewStatus currentStatus;
  UserModel currentUser;
  String countryCode = "TW";
  String languageCode = "zh";
  ThemeData currentTheme;

  void setCurrentUser ({
    @required UserModel user,
  }) {
    if (currentUser != user) {
      currentUser = user;
      currentStatus = ViewStatus.user;
    }
  }

  void setVisitor() {
    currentStatus = ViewStatus.visitor;
  }

  Future<bool> logout() async {
    MainPrefs prefs = MainPrefs(prefs: await SharedPreferences.getInstance());
    bool process = false;
    if (currentUser != null) {
      if (prefs.getInt(key: "id") != null) {
        process = await prefs.removeKey(key: "id");
      }
      if (prefs.getString(key: "account") != null) {
        process = await prefs.removeKey(key: "account");
      }
      if (prefs.getString(key: "user_name") != null) {
        process = await prefs.removeKey(key: "user_name");
      }
      if (prefs.getString(key: "profile") != null) {
        process = await prefs.removeKey(key: "profile");
      }
      if (prefs.getBool(key: "login") != null) {
        prefs.setBool(key: "login", value: false,);
      }
      currentUser = null;
      notifyListeners();
    }
    if (process) {
      setVisitor();
      return true;
    }
    return false;
  }

  Future<void> changeLanguage({@required Locale locale}) async {
    MainPrefs prefs = MainPrefs(prefs: await SharedPreferences.getInstance());
    prefs.setString(key: "languageCode", value: locale.languageCode,);
    prefs.setString(key: "countryCode", value: locale.countryCode??'',);
    languageCode = locale.languageCode;
    countryCode = locale.countryCode;
    notifyListeners();
  }

  Future<void> getLocale () async {
    MainPrefs prefs = MainPrefs(prefs: await SharedPreferences.getInstance());
    if (prefs.getString(key: "languageCode") != null) {
      languageCode = prefs.getString(key: "languageCode");
      countryCode = prefs.getString(key: "countryCode") == '' ? null : prefs.getString(key: "countryCode") ;
    }
  }

  Future<void> getTheme() async {
    currentTheme = buildLightTheme(languageCode);
    MainPrefs prefs = MainPrefs(prefs: await SharedPreferences.getInstance());
    if (prefs.getBool(key: "darkMode") != null) {
      if (prefs.getBool(key: "darkMode")) {
        currentTheme = buildDarkTheme(languageCode);
      }
    }
  }
}