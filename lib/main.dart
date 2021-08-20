import 'package:e_shopping/providers/browsed_history_provider.dart';
import 'package:e_shopping/providers/cart_notifier.dart';
import 'package:e_shopping/providers/category_notifier.dart';
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
  BrowsedHistoryProvider browsedHistoryProvider = BrowsedHistoryProvider();

  await myConfig.getLocale();
  await myConfig.getTheme();
  await myConfig.getLoginStatus();
  await browsedHistoryProvider.init();

  runApp(
    ChangeNotifierProvider<ConfigNotifier>.value(
      value: myConfig,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<LoadingNotifier>(
            create: (context) => LoadingNotifier()..loadingProcess(),
          ),
          ChangeNotifierProvider<BrowsedHistoryProvider>.value(
            value: browsedHistoryProvider,
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
          ChangeNotifierProvider<CategoryNotifier>(
            create: (context) => CategoryNotifier()
              ..preloadImages(context: context, cateID: 1,)
              ..preloadImages(context: context, cateID: 2,)
              ..preloadImages(context: context, cateID: 3,),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}


