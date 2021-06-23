import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPrefs {

  final SharedPreferences prefs;

  MainPrefs({@required this.prefs});

  int getInt({@required String key,}) {
   return prefs.getInt(key);
  }

  String getString({@required String key,}) {
    return prefs.getString(key);
  }

  bool getBool({@required String key,}) {
    return prefs.getBool(key);
  }

  Future<bool> setInt({@required String key, @required int value}) async {
    return await prefs.setInt(key, value);
  }

  Future<bool> setString({@required String key, @required String value}) async {
    return await prefs.setString(key, value);
  }

  Future<bool> setBool({@required String key, @required bool value}) async {
    return await prefs.setBool(key, value);
  }

  Future<bool> removeKey({@required String key,}) async {
    return await prefs.remove(key);
  }
}