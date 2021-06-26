import 'dart:convert';

import 'package:e_shopping/data/user.dart';
import 'package:e_shopping/utils/prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoadingDataStatus { initial, success, failure, }

class LoadingDataNotifier with ChangeNotifier {

  LoadingDataStatus currentStatus;

  UserModel user;

  Future<void> loadingUserDataProcess({
    @required BuildContext context,
  }) async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/json/user.json");
    final jsonResult = json.decode(data);
    if (jsonResult['result']) {
      MainPrefs prefs = MainPrefs(prefs: await SharedPreferences.getInstance(),);
      final data = jsonResult['data'];
      //載入測試用資料
      final userData = data[0];
      await prefs.setInt(key: "id", value: userData['id'],);
      await prefs.setString(key: "account", value: userData['account'],);
      await prefs.setString(key: "user_name", value: userData['user_name'],);
      await prefs.setString(key: "profile", value: userData['profile'],);
      await Future.delayed(Duration(seconds: 1,));
      user = UserModel.fromJson(userData);
      currentStatus = LoadingDataStatus.success;
      notifyListeners();
    } else {
      currentStatus = LoadingDataStatus.failure;
      notifyListeners();
    }
  }

  void setStatusToInitial() {
    currentStatus = LoadingDataStatus.initial;
  }
}