import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/providers/search_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_shopping/screens/shopping.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';

class MyApp extends StatefulWidget {
  const MyApp();
  @override createState() => _AppPage();
}

class _AppPage extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchNotifier>(create: (context) => SearchNotifier(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale(
          context.watch<ConfigNotifier>().languageCode!,
          context.watch<ConfigNotifier>().countryCode,
        ),
        title: 'e-shop',
        theme: context.watch<ConfigNotifier>().currentTheme,
        home: Shopping(),
      ),
    );
  }
}