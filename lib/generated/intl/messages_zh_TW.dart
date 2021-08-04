// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_TW locale. All the
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
  String get localeName => 'zh_TW';

  static String m0(number) => "${number} 件商品";

  static String m1(account) => "@${account}";

  static String m2(username) => "@${username}";

  static String m3(count) => "數量: ${count}";

  static String m4(size) => "大小: ${size}";

  static String m5(theme) => "更改成${theme}";

  static String m6(theme) => "已經是${theme}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountInput": MessageLookupByLibrary.simpleMessage("輸入會員帳號"),
        "addToCart": MessageLookupByLibrary.simpleMessage("加入購物車"),
        "addToFavorite": MessageLookupByLibrary.simpleMessage("加到我的最愛"),
        "addedToCart": MessageLookupByLibrary.simpleMessage("此產品已加入到購物車"),
        "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage("已經有會員帳號"),
        "cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "cart": MessageLookupByLibrary.simpleMessage("購物車"),
        "cartItems": m0,
        "checkOut": MessageLookupByLibrary.simpleMessage("結帳"),
        "comments": MessageLookupByLibrary.simpleMessage("商品評論"),
        "count": MessageLookupByLibrary.simpleMessage("數量"),
        "countHint": MessageLookupByLibrary.simpleMessage("選擇數量"),
        "creating": MessageLookupByLibrary.simpleMessage("建立中..."),
        "customerService": MessageLookupByLibrary.simpleMessage("客服中心"),
        "darkMode": MessageLookupByLibrary.simpleMessage("暗黑主題"),
        "emptyCart": MessageLookupByLibrary.simpleMessage("購物車是空的"),
        "emptyComments": MessageLookupByLibrary.simpleMessage("此商品尚無評論"),
        "emptyFavorite": MessageLookupByLibrary.simpleMessage("尚無產品加入我的最愛"),
        "favorite": MessageLookupByLibrary.simpleMessage("我的最愛"),
        "goToCart": MessageLookupByLibrary.simpleMessage("前往購物車"),
        "homepage": MessageLookupByLibrary.simpleMessage("首頁"),
        "hotProduct": MessageLookupByLibrary.simpleMessage("熱門商品"),
        "language": MessageLookupByLibrary.simpleMessage("語系"),
        "latestNews": MessageLookupByLibrary.simpleMessage("最新消息"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("一般主題"),
        "loggingOut": MessageLookupByLibrary.simpleMessage("登出中.."),
        "login": MessageLookupByLibrary.simpleMessage("登入"),
        "loginAccount": m1,
        "loginFailure": MessageLookupByLibrary.simpleMessage("登入失敗"),
        "loginFailureMsgOne":
            MessageLookupByLibrary.simpleMessage("登入資料儲存失敗，請在試一次"),
        "loginUsername": m2,
        "logout": MessageLookupByLibrary.simpleMessage("登出"),
        "logoutFailure": MessageLookupByLibrary.simpleMessage("登出失敗"),
        "logoutMsg": MessageLookupByLibrary.simpleMessage("確定登出此裝置嗎?"),
        "logoutSuccessfully": MessageLookupByLibrary.simpleMessage("已成功登出"),
        "memberCenter": MessageLookupByLibrary.simpleMessage("紀錄中心"),
        "memberLogin": MessageLookupByLibrary.simpleMessage("會員登入"),
        "memberLogout": MessageLookupByLibrary.simpleMessage("會員登出"),
        "memberSignup": MessageLookupByLibrary.simpleMessage("會員註冊"),
        "nameInput": MessageLookupByLibrary.simpleMessage("輸入名字"),
        "needSignupMsg": MessageLookupByLibrary.simpleMessage("沒有帳號嗎?"),
        "notification": MessageLookupByLibrary.simpleMessage("訊息通知"),
        "ok": MessageLookupByLibrary.simpleMessage("確認"),
        "orderCount": m3,
        "passwordInput": MessageLookupByLibrary.simpleMessage("輸入會員密碼"),
        "personalInfo": MessageLookupByLibrary.simpleMessage("個人資料"),
        "productCategory": MessageLookupByLibrary.simpleMessage("產品分類"),
        "productCollections": MessageLookupByLibrary.simpleMessage("收藏商品"),
        "productName": MessageLookupByLibrary.simpleMessage("產品名稱"),
        "productSearchHint": MessageLookupByLibrary.simpleMessage("產品搜尋"),
        "productSize": m4,
        "removeFromFavorite": MessageLookupByLibrary.simpleMessage("移除我的最愛"),
        "search": MessageLookupByLibrary.simpleMessage("產品搜尋"),
        "setting": MessageLookupByLibrary.simpleMessage("設定"),
        "settingTheme": m5,
        "settingThemeAlert": m6,
        "shareHint": MessageLookupByLibrary.simpleMessage("社群分享"),
        "shoppingHistory": MessageLookupByLibrary.simpleMessage("購物紀錄"),
        "signup": MessageLookupByLibrary.simpleMessage("註冊"),
        "signupFailure": MessageLookupByLibrary.simpleMessage("會員建立失敗"),
        "signupLabel": MessageLookupByLibrary.simpleMessage("建立會員"),
        "size": MessageLookupByLibrary.simpleMessage("尺寸"),
        "sizeHint": MessageLookupByLibrary.simpleMessage("選擇尺寸"),
        "theme": MessageLookupByLibrary.simpleMessage("切換主題"),
        "total": MessageLookupByLibrary.simpleMessage("總共"),
        "validating": MessageLookupByLibrary.simpleMessage("驗證中..."),
        "visitorGreeting": MessageLookupByLibrary.simpleMessage("訪客，你好!")
      };
}
