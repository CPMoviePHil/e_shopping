import 'package:e_shopping/configs/constants.dart';
import 'package:e_shopping/data/user.dart';
import 'package:e_shopping/utils/prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigNotifier with ChangeNotifier {

  ViewStatus currentStatus;
  UserModel currentUser;

  void setCurrentUser ({
    @required UserModel user,
  }) {
    if (currentUser != user) {
      currentUser = user;
      currentStatus = ViewStatus.user;
      notifyListeners();
    }
  }

  void setVisitor() {
    currentStatus = ViewStatus.visitor;
    notifyListeners();
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
      currentUser = null;
      notifyListeners();
    }
    if (process) {
      setVisitor();
      return true;
    }
    return false;
  }

}