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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
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

  /// `{username}`
  String loginUsername(Object username) {
    return Intl.message(
      '$username',
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
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}