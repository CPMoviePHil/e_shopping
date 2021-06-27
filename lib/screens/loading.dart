import 'package:e_shopping/main.dart';
import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/providers/loading_server_data_notifier.dart';
import 'package:e_shopping/screens/user_data_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ConfigNotifier>(
      builder: (context, config, _child,) {
        if (config.isLogin!) {
          context.read<LoadingDataNotifier>().setStatusToInitial();
          context.read<LoadingDataNotifier>().loadingUserDataProcess(context: context);
          return UserDataLoading();
        } else {
          context.read<ConfigNotifier>()..setVisitor();
        }
        return HomeScreen();
      },
    );
  }
}