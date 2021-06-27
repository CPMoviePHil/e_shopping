// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(number) => "${number} items";

  static String m1(account) => "@${account}";

  static String m2(username) => "@${username}";

  static String m3(theme) => "set theme to ${theme}";

  static String m4(theme) => "${theme} already been set!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountInput": MessageLookupByLibrary.simpleMessage("account"),
        "addToCart": MessageLookupByLibrary.simpleMessage("Add To Cart"),
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Already Have an Account?"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cart": MessageLookupByLibrary.simpleMessage("Cart"),
        "cartItems": m0,
        "checkOut": MessageLookupByLibrary.simpleMessage("Check Out"),
        "creating": MessageLookupByLibrary.simpleMessage("Creating..."),
        "customerService":
            MessageLookupByLibrary.simpleMessage("Customer Service"),
        "darkMode": MessageLookupByLibrary.simpleMessage("dark mode"),
        "emptyCart": MessageLookupByLibrary.simpleMessage("Your cart is empty"),
        "hotProduct": MessageLookupByLibrary.simpleMessage("Hot Product"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "latestNews": MessageLookupByLibrary.simpleMessage("Latest News"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("light mode"),
        "loggingOut": MessageLookupByLibrary.simpleMessage("Logging out..."),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginAccount": m1,
        "loginFailure": MessageLookupByLibrary.simpleMessage("Login Failure"),
        "loginFailureMsgOne": MessageLookupByLibrary.simpleMessage(
            "Login Data save failure, Please try again"),
        "loginUsername": m2,
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "logoutFailure": MessageLookupByLibrary.simpleMessage("Logout failure"),
        "logoutMsg": MessageLookupByLibrary.simpleMessage(
            "You sure want to log out this device?"),
        "logoutSuccessfully":
            MessageLookupByLibrary.simpleMessage("Logout successfully"),
        "memberCenter": MessageLookupByLibrary.simpleMessage("Member Center"),
        "memberLogin": MessageLookupByLibrary.simpleMessage("Member Login"),
        "memberLogout": MessageLookupByLibrary.simpleMessage("Member logout"),
        "memberSignup": MessageLookupByLibrary.simpleMessage("Member Signup"),
        "nameInput": MessageLookupByLibrary.simpleMessage("name"),
        "needSignupMsg":
            MessageLookupByLibrary.simpleMessage("Don\'t have a account?"),
        "notification": MessageLookupByLibrary.simpleMessage("Notifications"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "passwordInput": MessageLookupByLibrary.simpleMessage("password"),
        "personalInfo": MessageLookupByLibrary.simpleMessage("Personal Info"),
        "productCategory":
            MessageLookupByLibrary.simpleMessage("Product Category"),
        "productCollections":
            MessageLookupByLibrary.simpleMessage("Product Collection"),
        "productName": MessageLookupByLibrary.simpleMessage("Product Name"),
        "productSearchHint":
            MessageLookupByLibrary.simpleMessage("Search for a product"),
        "setting": MessageLookupByLibrary.simpleMessage("Setting"),
        "settingTheme": m3,
        "settingThemeAlert": m4,
        "shoppingHistory":
            MessageLookupByLibrary.simpleMessage("Shopping History"),
        "signup": MessageLookupByLibrary.simpleMessage("Signup"),
        "signupFailure": MessageLookupByLibrary.simpleMessage("Signup failure"),
        "signupLabel": MessageLookupByLibrary.simpleMessage("Create"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "total": MessageLookupByLibrary.simpleMessage("Total"),
        "validating": MessageLookupByLibrary.simpleMessage("Validating..."),
        "visitorGreeting":
            MessageLookupByLibrary.simpleMessage("Hello, Visitor!")
      };
}
