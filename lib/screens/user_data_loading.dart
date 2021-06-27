import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/providers/loading_server_data_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/homepage.dart';

class UserDataLoading extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Consumer<LoadingDataNotifier>(
          builder: (context, loading, _loading) {
            if (loading.currentStatus == LoadingDataStatus.success) {
              context.read<ConfigNotifier>()..setCurrentUser(user: loading.user,);
              return Builder(
                builder: (context) => HomeScreen(),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}