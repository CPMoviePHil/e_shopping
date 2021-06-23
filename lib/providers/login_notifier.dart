import 'dart:math';

import 'package:e_shopping/utils/prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginStatus { initial, validating, success, failure, save_failure, }

class LoginNotifier with ChangeNotifier {

  LoginStatus currentStatus = LoginStatus.initial;

  bool hidePassword = true;

  Future<void> formValidation ({
    @required String account,
    @required String password,
  }) async {
    currentStatus = LoginStatus.validating;
    notifyListeners();
    if (await accountInput(account: account) && await passwordInput(password: password)) {
      MainPrefs prefs = MainPrefs(prefs: await SharedPreferences.getInstance());
      if (await prefs.setBool(key: "login", value: true,)) {
        currentStatus = LoginStatus.success;
        notifyListeners();
      } else {
        currentStatus = LoginStatus.save_failure;
        notifyListeners();
      }
    } else {
      currentStatus = LoginStatus.failure;
      notifyListeners();
    }
  }

  Future<bool> accountInput ({@required String account}) async {
    if (account.length > 5) {
      await Future.delayed(Duration(seconds: 2));
      if (account == "myteacher") {
        return true;
      }
      if (Random().nextInt(10) == 0) {
        return true;
      }
    }
    return false;
  }

  Future<bool> passwordInput ({@required String password}) async {
    if (password.length > 5) {
      await Future.delayed(Duration(seconds: 2));
      if (password == "gotabigdick") {
        return true;
      }
      if (Random().nextInt(10) == 0) {
        return true;
      }
    }
    return false;
  }

  void changeHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }
}