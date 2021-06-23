import 'package:flutter/cupertino.dart';

class SignupNotifier with ChangeNotifier {

  bool hidePassword = true;

  void changeHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }
}