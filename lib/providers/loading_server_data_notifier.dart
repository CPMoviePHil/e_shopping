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
    currentStatus = LoadingDataStatus.initial;
    notifyListeners();
    String data = await DefaultAssetBundle.of(context).loadString("assets/json/user.json");
    final jsonResult = json.decode(data);
    if (jsonResult['result']) {
      MainPrefs prefs = MainPrefs(prefs: await SharedPreferences.getInstance(),);
      final data = jsonResult['data'];
      await prefs.setInt(key: "id", value: data['id'],);
      await prefs.setString(key: "account", value: data['account'],);
      await prefs.setString(key: "user_name", value: data['user_name'],);
      await Future.delayed(Duration(seconds: 1,));
      user = UserModel.fromJson(data);
      currentStatus = LoadingDataStatus.success;
      notifyListeners();
    } else {
      currentStatus = LoadingDataStatus.failure;
      notifyListeners();
    }
  }
}