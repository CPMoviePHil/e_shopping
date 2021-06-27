import 'package:e_shopping/configs/constants.dart';
import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/screens/cart/appbar.dart';
import 'package:e_shopping/screens/navigation/bottom_navigator.dart';
import 'package:e_shopping/screens/navigation/search/search.dart';
import 'package:e_shopping/screens/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../left_list.dart';
import 'home/home.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController pageController = PageController(initialPage: 0, keepPage: true,);
  int pageIndex = 0;

  final List<Widget> pageList = <Widget>[
    Home(),
    Search(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  void bottomNavigator (int index) {
    pageController.jumpToPage(index);
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => scaffoldKey.currentState!.openDrawer(),
            child: const Icon(Icons.menu),  // add custom icons also),
          ),
          title: SearchBar(),
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
        body: PageView(
          children: pageList,
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: BottomNavigator(
          pageIndex: pageIndex,
          onTap: bottomNavigator,
        ),
      ),
    );
  }
}