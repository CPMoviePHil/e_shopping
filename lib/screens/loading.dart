import 'package:e_shopping/providers/loading_notifier.dart';
import 'package:e_shopping/providers/loading_server_data_notifier.dart';
import 'package:e_shopping/providers/login_notifier.dart';
import 'package:e_shopping/screens/login.dart';
import 'package:e_shopping/screens/user_data_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadingNotifier>(
      builder: (context, loading, _loading) {
        if (loading.currentStatus == LoadingStatus.success) {
          if (loading.isLogin) {
            return Builder(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => LoadingDataNotifier()..loadingUserDataProcess(
                  context: context,
                ),
                child: UserDataLoading(),
              ),
            );
          } else {
            return ChangeNotifierProvider(
              create: (context) => LoginNotifier(),
              child: Login(),
            );
          }
        }
        return Scaffold(
          body: Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}