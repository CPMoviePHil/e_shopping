import 'package:e_shopping/data/user.dart';
import 'package:flutter/cupertino.dart';

class ConfigNotifier with ChangeNotifier {

  UserModel currentUser;

  void setCurrentUser({@required UserModel user,}) {
    if (currentUser != user) {
      currentUser = user;
      notifyListeners();
    }
  }

}