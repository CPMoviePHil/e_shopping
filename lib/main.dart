import 'package:e_shopping/providers/cart_notifier.dart';
import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/providers/favorite.dart';
import 'package:e_shopping/providers/loading_notifier.dart';
import 'package:e_shopping/providers/loading_server_data_notifier.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ConfigNotifier myConfig = ConfigNotifier();
  await myConfig.getLocale();
  await myConfig.getTheme();
  await myConfig.getLoginStatus();

  runApp(
    ChangeNotifierProvider<ConfigNotifier>.value(
      value: myConfig,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<LoadingNotifier>(
            create: (context) => LoadingNotifier()..loadingProcess(),
          ),
          ChangeNotifierProvider<LoadingDataNotifier>(
            create: (context) => LoadingDataNotifier(),
          ),
          ChangeNotifierProvider<CartNotifier>(
            create: (context) => CartNotifier(),
          ),
          ChangeNotifierProvider<FavoriteProvider>(
            create: (context) => FavoriteProvider(),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}


