import 'package:flutter/cupertino.dart';

class ConfigNotifier with ChangeNotifier {

  int currentUser = -1;

  String currentUserName = '';

  void setCurrentUser({@required int userID,}) {
    if (currentUser != userID) {
      currentUser = userID;
      notifyListeners();
    }
  }

  void setCurrentUserName({@required String userName,}) {
    if (currentUserName != userName) {
      currentUserName = userName;
      notifyListeners();
    }
  }
}