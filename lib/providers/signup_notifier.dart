import 'package:flutter/cupertino.dart';

enum SignupStatus { initial, validating, success, failure, }

class SignupNotifier with ChangeNotifier {

  SignupStatus currentStatus = SignupStatus.initial;
  bool hidePassword = true;

  Future<void> formValidation ({
    @required String name,
    @required String account,
    @required String password,
  }) async {
    currentStatus = SignupStatus.validating;
    notifyListeners();
    if (await nameInput(name: name) &&
        await accountInput(account: account) &&
        await passwordInput(password: password)
    ) {
      await Future.delayed(Duration(seconds: 1));
      currentStatus = SignupStatus.success;
      notifyListeners();
    } else {
      currentStatus = SignupStatus.failure;
      notifyListeners();
    }
  }

  Future<bool> accountInput ({@required String account}) async {
    if (account.length > 5) {
      await Future.delayed(Duration(seconds: 1));
      return true;
    }
    return false;
  }

  Future<bool> nameInput ({@required String name}) async {
    if (name.length > 5) {
      await Future.delayed(Duration(seconds: 1));
      return true;
    }
    return false;
  }

  Future<bool> passwordInput ({@required String password}) async {
    if (password.length > 5) {
      await Future.delayed(Duration(seconds: 1));
      return true;
    }
    return false;
  }

  void changeHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }
}