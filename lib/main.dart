import 'package:e_shopping/configs/constants.dart';
import 'package:e_shopping/providers/cart_notifier.dart';
import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/providers/loading_notifier.dart';
import 'package:e_shopping/providers/loading_server_data_notifier.dart';
import 'package:e_shopping/screens/cart/appbar.dart';
import 'package:e_shopping/screens/category/category_tile.dart';
import 'package:e_shopping/screens/left_list.dart';
import 'package:e_shopping/screens/loading.dart';
import 'package:e_shopping/screens/product/product_tile.dart';
import 'package:e_shopping/screens/search/search.dart';
import 'package:e_shopping/temp_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'data/product.dart';
import 'generated/l10n.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  String token = await messaging.getToken();
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
          create: (context)=> CartNotifier(),
        ),
      ],
      child: MyApp(token: token,),
    ),),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  final String token;
  const MyApp({@required this.token,});

  @override createState() => _AppPage();
}

class _AppPage extends State<MyApp> {

  configureFirebaseListeners(){
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification
    );
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid,iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,);
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      if (message != null) {
        if (message.data['type'] == "sign_out") {

        } else if (message.data['type'] == "leave") {

        }
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {

      // 判定型號
      if (Platform.isAndroid) {
        print("remote:${message.data['type'] }");
        if (message.data['type'] == "sign_out") {

        } else if (message.data['type'] == "leave") {

        } else {
          showNotification(message.notification.title, message.notification.body, message.data['id']);
        }
      } else if (Platform.isIOS) {
        if (message.data['type'] == "sign_out") {

        } else if (message.data['type'] == "leave") {

        } else {
          showNotification(message.notification.title, message.notification.body, message.data['google.c.sender.id']);
        }
      }
    });
  }

  Future onDidReceiveLocalNotification(int id, String title, String body, String payload) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Text(payload),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void showNotification(String title, String body, String id) async {
    await _demoNotification(title, body, id);
  }

  Future<void> _demoNotification(String title, String body, String id) async {
    var android = AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.high, importance: Importance.max);
    var iOS = IOSNotificationDetails();
    var platform = new NotificationDetails(android:android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(0, title, body, platform, payload: id);
  }

  @override
  void initState() {
    // TODO: implement initState
    configureFirebaseListeners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(
        context.watch<ConfigNotifier>().languageCode,
        context.watch<ConfigNotifier>().countryCode,
      ),
      title: 'Flutter Demo',
      theme: context.watch<ConfigNotifier>().currentTheme,
      home: SimpleShopping(),
    );
  }
}

class SimpleShopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Loading();
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchString;
  bool isLowToHigh;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    searchString = '';
    super.initState();
  }

  void setSearchString(String value) {
    setState(() {
      searchString = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets listViewPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 24);
    List<Widget> searchResultTiles = [];
    if (searchString.isNotEmpty) {
      if (isLowToHigh) {
        List<Product> productsToSort;
        for( int i = 0; i < products.length; i++) {
          if (products[i].cost > products[i+1].cost) {
            productsToSort.add(products[i]);
          }
        }
        searchResultTiles = products.where((p)
        => p.name.toLowerCase().contains(searchString.toLowerCase())).map((p)
        => ProductTile(product: p),
        ).toList();
      }
    }
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => scaffoldKey.currentState.openDrawer(),
          child: const Icon(Icons.menu),  // add custom icons also),
        ),
        title: SearchBar(
          onChanged: setSearchString,
        ),
        actions: [
          CartAppBarAction(),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: context.watch<ConfigNotifier>().currentStatus == ViewStatus.visitor
              ? Colors.white
              : Theme.of(context).primaryColor,
          width: MediaQuery.of(context).size.width * 0.7,
          child: SafeArea(
            child: Container(
              height: double.infinity,
              child: LeftList(),
            ),
          ),
        ),
      ),
      key: scaffoldKey,
      body: searchString.isNotEmpty ?
      GridView.count(
        padding: listViewPadding,
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: .78,
        children: searchResultTiles,
      ) : ListView(
        padding: listViewPadding,
        children: [
          Text(
            "Shop by Category",
            style: Theme.of(context).textTheme.headline5,
          ),
          //SizedBox(height: 16),
          CategoryTile(
            imageUrl: manLookRightImageUrl,
            category: menCategory,
            imageAlignment: Alignment.topCenter,
          ),
          SizedBox(height: 16),
          CategoryTile(
            imageUrl: womanLookLeftImageUrl,
            category: womenCategory,
            imageAlignment: Alignment.topCenter,
          ),
          SizedBox(height: 16),
          CategoryTile(
            imageUrl: dogImageUrl, // TODO: Replace with your own image
            category: petCategory,
          ),
        ],
      ),
    );
  }
}


