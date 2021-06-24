// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(account) => "@${account}";

  static m1(username) => "${username}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "accountInput" : MessageLookupByLibrary.simpleMessage("account"),
    "alreadyHaveAccount" : MessageLookupByLibrary.simpleMessage("Already Have an Account?"),
    "creating" : MessageLookupByLibrary.simpleMessage("Creating..."),
    "customerService" : MessageLookupByLibrary.simpleMessage("Customer Service"),
    "hotProduct" : MessageLookupByLibrary.simpleMessage("Hot Product"),
    "language" : MessageLookupByLibrary.simpleMessage("Language"),
    "latestNews" : MessageLookupByLibrary.simpleMessage("Latest News"),
    "loggingOut" : MessageLookupByLibrary.simpleMessage("Logging out..."),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "loginAccount" : m0,
    "loginFailure" : MessageLookupByLibrary.simpleMessage("Login Failure"),
    "loginFailureMsgOne" : MessageLookupByLibrary.simpleMessage("Login Data save failure, Please try again"),
    "loginUsername" : m1,
    "logout" : MessageLookupByLibrary.simpleMessage("Logout"),
    "logoutFailure" : MessageLookupByLibrary.simpleMessage("Logout failure"),
    "logoutMsg" : MessageLookupByLibrary.simpleMessage("You sure want to log out this device?"),
    "logoutSuccessfully" : MessageLookupByLibrary.simpleMessage("Logout successfully"),
    "memberCenter" : MessageLookupByLibrary.simpleMessage("Member Center"),
    "memberLogin" : MessageLookupByLibrary.simpleMessage("Member Login"),
    "memberLogout" : MessageLookupByLibrary.simpleMessage("Member logout"),
    "memberSignup" : MessageLookupByLibrary.simpleMessage("Member Signup"),
    "nameInput" : MessageLookupByLibrary.simpleMessage("name"),
    "needSignupMsg" : MessageLookupByLibrary.simpleMessage("Don\'t have a account?"),
    "notification" : MessageLookupByLibrary.simpleMessage("Notifications"),
    "passwordInput" : MessageLookupByLibrary.simpleMessage("password"),
    "personalInfo" : MessageLookupByLibrary.simpleMessage("Personal Info"),
    "productCollections" : MessageLookupByLibrary.simpleMessage("Product Collection"),
    "setting" : MessageLookupByLibrary.simpleMessage("Setting"),
    "signup" : MessageLookupByLibrary.simpleMessage("Signup"),
    "signupFailure" : MessageLookupByLibrary.simpleMessage("Signup failure"),
    "signupLabel" : MessageLookupByLibrary.simpleMessage("Create"),
    "validating" : MessageLookupByLibrary.simpleMessage("Validating..."),
    "visitorGreeting" : MessageLookupByLibrary.simpleMessage("Hello, Visitor!")
  };
}
