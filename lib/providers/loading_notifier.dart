import 'package:e_shopping/utils/prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoadingStatus { initial, success, failure, }

class LoadingNotifier with ChangeNotifier {

  LoadingStatus currentStatus = LoadingStatus.initial;
  bool isLogin = false;

  Future<void> loadingProcess() async {
    MainPrefs prefs = MainPrefs(prefs: await SharedPreferences.getInstance(),);
    await Future.delayed(Duration(seconds: 3,));
    if (prefs.getBool(key: 'login',) == null) {
      currentStatus = LoadingStatus.success;
      notifyListeners();
    } else {
      currentStatus = LoadingStatus.success;
      if (prefs.getBool(key: 'login',)) {
        isLogin = true;
      }
      notifyListeners();
    }
  }
}