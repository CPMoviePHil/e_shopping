// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_TW locale. All the
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
  String get localeName => 'zh_TW';

  static m0(account) => "@${account}";

  static m1(username) => "${username}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "accountInput" : MessageLookupByLibrary.simpleMessage("輸入會員帳號"),
    "alreadyHaveAccount" : MessageLookupByLibrary.simpleMessage("已經有會員帳號"),
    "creating" : MessageLookupByLibrary.simpleMessage("建立中..."),
    "customerService" : MessageLookupByLibrary.simpleMessage("客服中心"),
    "hotProduct" : MessageLookupByLibrary.simpleMessage("熱門商品"),
    "latestNews" : MessageLookupByLibrary.simpleMessage("最新消息"),
    "loggingOut" : MessageLookupByLibrary.simpleMessage("登出中.."),
    "login" : MessageLookupByLibrary.simpleMessage("登入"),
    "loginAccount" : m0,
    "loginFailure" : MessageLookupByLibrary.simpleMessage("登入失敗"),
    "loginFailureMsgOne" : MessageLookupByLibrary.simpleMessage("登入資料儲存失敗，請在試一次"),
    "loginUsername" : m1,
    "logout" : MessageLookupByLibrary.simpleMessage("登出"),
    "logoutFailure" : MessageLookupByLibrary.simpleMessage("登出失敗"),
    "logoutMsg" : MessageLookupByLibrary.simpleMessage("確定登出此裝置嗎?"),
    "logoutSuccessfully" : MessageLookupByLibrary.simpleMessage("已成功登出"),
    "memberCenter" : MessageLookupByLibrary.simpleMessage("紀錄中心"),
    "memberLogin" : MessageLookupByLibrary.simpleMessage("會員登入"),
    "memberLogout" : MessageLookupByLibrary.simpleMessage("會員登出"),
    "memberSignup" : MessageLookupByLibrary.simpleMessage("會員註冊"),
    "nameInput" : MessageLookupByLibrary.simpleMessage("輸入名字"),
    "needSignupMsg" : MessageLookupByLibrary.simpleMessage("沒有帳號嗎?"),
    "notification" : MessageLookupByLibrary.simpleMessage("訊息通知"),
    "passwordInput" : MessageLookupByLibrary.simpleMessage("輸入會員密碼"),
    "personalInfo" : MessageLookupByLibrary.simpleMessage("個人資料"),
    "productCollections" : MessageLookupByLibrary.simpleMessage("收藏商品"),
    "setting" : MessageLookupByLibrary.simpleMessage("設定"),
    "signup" : MessageLookupByLibrary.simpleMessage("註冊"),
    "signupFailure" : MessageLookupByLibrary.simpleMessage("會員建立失敗"),
    "signupLabel" : MessageLookupByLibrary.simpleMessage("建立會員"),
    "validating" : MessageLookupByLibrary.simpleMessage("驗證中..."),
    "visitorGreeting" : MessageLookupByLibrary.simpleMessage("訪客，你好!")
  };
}
