// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get homepage {
    return Intl.message(
      'Home',
      name: 'homepage',
      desc: '',
      args: [],
    );
  }

  /// `Product Search`
  String get search {
    return Intl.message(
      'Product Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Hot Product`
  String get hotProduct {
    return Intl.message(
      'Hot Product',
      name: 'hotProduct',
      desc: '',
      args: [],
    );
  }

  /// `Product Collection`
  String get productCollections {
    return Intl.message(
      'Product Collection',
      name: 'productCollections',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Latest News`
  String get latestNews {
    return Intl.message(
      'Latest News',
      name: 'latestNews',
      desc: '',
      args: [],
    );
  }

  /// `Member Center`
  String get memberCenter {
    return Intl.message(
      'Member Center',
      name: 'memberCenter',
      desc: '',
      args: [],
    );
  }

  /// `Personal Info`
  String get personalInfo {
    return Intl.message(
      'Personal Info',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Customer Service`
  String get customerService {
    return Intl.message(
      'Customer Service',
      name: 'customerService',
      desc: '',
      args: [],
    );
  }

  /// `Shopping History`
  String get shoppingHistory {
    return Intl.message(
      'Shopping History',
      name: 'shoppingHistory',
      desc: '',
      args: [],
    );
  }

  /// `Product Category`
  String get productCategory {
    return Intl.message(
      'Product Category',
      name: 'productCategory',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Login Failure`
  String get loginFailure {
    return Intl.message(
      'Login Failure',
      name: 'loginFailure',
      desc: '',
      args: [],
    );
  }

  /// `Login Data save failure, Please try again`
  String get loginFailureMsgOne {
    return Intl.message(
      'Login Data save failure, Please try again',
      name: 'loginFailureMsgOne',
      desc: '',
      args: [],
    );
  }

  /// `Member Login`
  String get memberLogin {
    return Intl.message(
      'Member Login',
      name: 'memberLogin',
      desc: '',
      args: [],
    );
  }

  /// `Already Have an Account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already Have an Account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `You sure want to log out this device?`
  String get logoutMsg {
    return Intl.message(
      'You sure want to log out this device?',
      name: 'logoutMsg',
      desc: '',
      args: [],
    );
  }

  /// `Logging out...`
  String get loggingOut {
    return Intl.message(
      'Logging out...',
      name: 'loggingOut',
      desc: '',
      args: [],
    );
  }

  /// `Logout successfully`
  String get logoutSuccessfully {
    return Intl.message(
      'Logout successfully',
      name: 'logoutSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Logout failure`
  String get logoutFailure {
    return Intl.message(
      'Logout failure',
      name: 'logoutFailure',
      desc: '',
      args: [],
    );
  }

  /// `Member logout`
  String get memberLogout {
    return Intl.message(
      'Member logout',
      name: 'memberLogout',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get signup {
    return Intl.message(
      'Signup',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Signup failure`
  String get signupFailure {
    return Intl.message(
      'Signup failure',
      name: 'signupFailure',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get signupLabel {
    return Intl.message(
      'Create',
      name: 'signupLabel',
      desc: '',
      args: [],
    );
  }

  /// `Creating...`
  String get creating {
    return Intl.message(
      'Creating...',
      name: 'creating',
      desc: '',
      args: [],
    );
  }

  /// `Don't have a account?`
  String get needSignupMsg {
    return Intl.message(
      'Don\'t have a account?',
      name: 'needSignupMsg',
      desc: '',
      args: [],
    );
  }

  /// `Member Signup`
  String get memberSignup {
    return Intl.message(
      'Member Signup',
      name: 'memberSignup',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `@{account}`
  String loginAccount(Object account) {
    return Intl.message(
      '@$account',
      name: 'loginAccount',
      desc: '',
      args: [account],
    );
  }

  /// `@{username}`
  String loginUsername(Object username) {
    return Intl.message(
      '@$username',
      name: 'loginUsername',
      desc: '',
      args: [username],
    );
  }

  /// `Hello, Visitor!`
  String get visitorGreeting {
    return Intl.message(
      'Hello, Visitor!',
      name: 'visitorGreeting',
      desc: '',
      args: [],
    );
  }

  /// `Validating...`
  String get validating {
    return Intl.message(
      'Validating...',
      name: 'validating',
      desc: '',
      args: [],
    );
  }

  /// `account`
  String get accountInput {
    return Intl.message(
      'account',
      name: 'accountInput',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get passwordInput {
    return Intl.message(
      'password',
      name: 'passwordInput',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get nameInput {
    return Intl.message(
      'name',
      name: 'nameInput',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `dark mode`
  String get darkMode {
    return Intl.message(
      'dark mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `light mode`
  String get lightTheme {
    return Intl.message(
      'light mode',
      name: 'lightTheme',
      desc: '',
      args: [],
    );
  }

  /// `set theme to {theme}`
  String settingTheme(Object theme) {
    return Intl.message(
      'set theme to $theme',
      name: 'settingTheme',
      desc: '',
      args: [theme],
    );
  }

  /// `{theme} already been set!`
  String settingThemeAlert(Object theme) {
    return Intl.message(
      '$theme already been set!',
      name: 'settingThemeAlert',
      desc: '',
      args: [theme],
    );
  }

  /// `Product Name`
  String get productName {
    return Intl.message(
      'Product Name',
      name: 'productName',
      desc: '',
      args: [],
    );
  }

  /// `Search for a product`
  String get productSearchHint {
    return Intl.message(
      'Search for a product',
      name: 'productSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get addToCart {
    return Intl.message(
      'Add To Cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Your cart is empty`
  String get emptyCart {
    return Intl.message(
      'Your cart is empty',
      name: 'emptyCart',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Check Out`
  String get checkOut {
    return Intl.message(
      'Check Out',
      name: 'checkOut',
      desc: '',
      args: [],
    );
  }

  /// `{number} items`
  String cartItems(Object number) {
    return Intl.message(
      '$number items',
      name: 'cartItems',
      desc: '',
      args: [number],
    );
  }

  /// `Size: {size}`
  String productSize(Object size) {
    return Intl.message(
      'Size: $size',
      name: 'productSize',
      desc: '',
      args: [size],
    );
  }

  /// `Count: {count}`
  String orderCount(Object count) {
    return Intl.message(
      'Count: $count',
      name: 'orderCount',
      desc: '',
      args: [count],
    );
  }

  /// `Count`
  String get count {
    return Intl.message(
      'Count',
      name: 'count',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Select Size`
  String get sizeHint {
    return Intl.message(
      'Select Size',
      name: 'sizeHint',
      desc: '',
      args: [],
    );
  }

  /// `Select Number`
  String get countHint {
    return Intl.message(
      'Select Number',
      name: 'countHint',
      desc: '',
      args: [],
    );
  }

  /// `Go To Cart`
  String get goToCart {
    return Intl.message(
      'Go To Cart',
      name: 'goToCart',
      desc: '',
      args: [],
    );
  }

  /// `Add To Favorite`
  String get addToFavorite {
    return Intl.message(
      'Add To Favorite',
      name: 'addToFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Remove Favorite`
  String get removeFromFavorite {
    return Intl.message(
      'Remove Favorite',
      name: 'removeFromFavorite',
      desc: '',
      args: [],
    );
  }

  /// `??????????????????????????????`
  String get addedToCart {
    return Intl.message(
      '??????????????????????????????',
      name: 'addedToCart',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `??????????????????????????????`
  String get emptyFavorite {
    return Intl.message(
      '??????????????????????????????',
      name: 'emptyFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get shareHint {
    return Intl.message(
      'Share',
      name: 'shareHint',
      desc: '',
      args: [],
    );
  }

  /// `????????????`
  String get comments {
    return Intl.message(
      '????????????',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `?????????????????????`
  String get emptyComments {
    return Intl.message(
      '?????????????????????',
      name: 'emptyComments',
      desc: '',
      args: [],
    );
  }

  /// `{days} ??????`
  String commentDay(Object days) {
    return Intl.message(
      '$days ??????',
      name: 'commentDay',
      desc: '',
      args: [days],
    );
  }

  /// `??????`
  String get report {
    return Intl.message(
      '??????',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `??????`
  String get more {
    return Intl.message(
      '??????',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `????????????`
  String get commentReportOption1 {
    return Intl.message(
      '????????????',
      name: 'commentReportOption1',
      desc: '',
      args: [],
    );
  }

  /// `?????????????????????`
  String get commentReportOption2 {
    return Intl.message(
      '?????????????????????',
      name: 'commentReportOption2',
      desc: '',
      args: [],
    );
  }

  /// `????????????????????????????????????????????????`
  String get commentReportOption3 {
    return Intl.message(
      '????????????????????????????????????????????????',
      name: 'commentReportOption3',
      desc: '',
      args: [],
    );
  }

  /// `????????????`
  String get createComment {
    return Intl.message(
      '????????????',
      name: 'createComment',
      desc: '',
      args: [],
    );
  }

  /// `????????????`
  String get deleteComment {
    return Intl.message(
      '????????????',
      name: 'deleteComment',
      desc: '',
      args: [],
    );
  }

  /// `????????????????????????????????????`
  String get commentHint {
    return Intl.message(
      '????????????????????????????????????',
      name: 'commentHint',
      desc: '',
      args: [],
    );
  }

  /// `??????`
  String get notificationType1 {
    return Intl.message(
      '??????',
      name: 'notificationType1',
      desc: '',
      args: [],
    );
  }

  /// `??????`
  String get notificationType2 {
    return Intl.message(
      '??????',
      name: 'notificationType2',
      desc: '',
      args: [],
    );
  }

  /// `{days} ??????`
  String daysAgo(Object days) {
    return Intl.message(
      '$days ??????',
      name: 'daysAgo',
      desc: '',
      args: [days],
    );
  }

  /// `{weeks} ??????`
  String weeksAgo(Object weeks) {
    return Intl.message(
      '$weeks ??????',
      name: 'weeksAgo',
      desc: '',
      args: [weeks],
    );
  }

  /// `{months} ??????`
  String monthAgo(Object months) {
    return Intl.message(
      '$months ??????',
      name: 'monthAgo',
      desc: '',
      args: [months],
    );
  }

  /// `{years} ??????`
  String yearsAgo(Object years) {
    return Intl.message(
      '$years ??????',
      name: 'yearsAgo',
      desc: '',
      args: [years],
    );
  }

  /// `My Account`
  String get myAccount {
    return Intl.message(
      'My Account',
      name: 'myAccount',
      desc: '',
      args: [],
    );
  }

  /// `My Reviews`
  String get myReviews {
    return Intl.message(
      'My Reviews',
      name: 'myReviews',
      desc: '',
      args: [],
    );
  }

  /// `My Purse`
  String get myPurse {
    return Intl.message(
      'My Purse',
      name: 'myPurse',
      desc: '',
      args: [],
    );
  }

  /// `My Favorite`
  String get myFavorite {
    return Intl.message(
      'My Favorite',
      name: 'myFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Browsed History`
  String get browsedHistory {
    return Intl.message(
      'Browsed History',
      name: 'browsedHistory',
      desc: '',
      args: [],
    );
  }

  /// `???????????????`
  String get noBrowsedHistory {
    return Intl.message(
      '???????????????',
      name: 'noBrowsedHistory',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
