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

  static String m1(days) => "${days} 天前";

  static String m2(days) => "${days} 天前";

  static String m3(account) => "@${account}";

  static String m4(username) => "@${username}";

  static String m5(months) => "${months} 月前";

  static String m6(count) => "Count: ${count}";

  static String m7(size) => "Size: ${size}";

  static String m8(theme) => "set theme to ${theme}";

  static String m9(theme) => "${theme} already been set!";

  static String m10(weeks) => "${weeks} 周前";

  static String m11(years) => "${years} 年前";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountInput": MessageLookupByLibrary.simpleMessage("account"),
        "addToCart": MessageLookupByLibrary.simpleMessage("Add To Cart"),
        "addToFavorite":
            MessageLookupByLibrary.simpleMessage("Add To Favorite"),
        "addedToCart": MessageLookupByLibrary.simpleMessage("此產品已加入到購物車"),
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Already Have an Account?"),
        "browsedHistory":
            MessageLookupByLibrary.simpleMessage("Browsed History"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cart": MessageLookupByLibrary.simpleMessage("Cart"),
        "cartItems": m0,
        "checkOut": MessageLookupByLibrary.simpleMessage("Check Out"),
        "commentDay": m1,
        "commentHint": MessageLookupByLibrary.simpleMessage("請在這裡填寫你的商品評論"),
        "commentReportOption1": MessageLookupByLibrary.simpleMessage("仇恨言論"),
        "commentReportOption2": MessageLookupByLibrary.simpleMessage("色情、暴力言論"),
        "commentReportOption3":
            MessageLookupByLibrary.simpleMessage("顛覆國家不正當政權、不負責的言論"),
        "comments": MessageLookupByLibrary.simpleMessage("商品評論"),
        "count": MessageLookupByLibrary.simpleMessage("Count"),
        "countHint": MessageLookupByLibrary.simpleMessage("Select Number"),
        "createComment": MessageLookupByLibrary.simpleMessage("建立評論"),
        "creating": MessageLookupByLibrary.simpleMessage("Creating..."),
        "customerService":
            MessageLookupByLibrary.simpleMessage("Customer Service"),
        "darkMode": MessageLookupByLibrary.simpleMessage("dark mode"),
        "daysAgo": m2,
        "deleteComment": MessageLookupByLibrary.simpleMessage("刪除評論"),
        "emptyCart": MessageLookupByLibrary.simpleMessage("Your cart is empty"),
        "emptyComments": MessageLookupByLibrary.simpleMessage("此商品尚無評論"),
        "emptyFavorite": MessageLookupByLibrary.simpleMessage("尚無產品加入我的最愛"),
        "favorite": MessageLookupByLibrary.simpleMessage("Favorite"),
        "goToCart": MessageLookupByLibrary.simpleMessage("Go To Cart"),
        "homepage": MessageLookupByLibrary.simpleMessage("Home"),
        "hotProduct": MessageLookupByLibrary.simpleMessage("Hot Product"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "latestNews": MessageLookupByLibrary.simpleMessage("Latest News"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("light mode"),
        "loggingOut": MessageLookupByLibrary.simpleMessage("Logging out..."),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginAccount": m3,
        "loginFailure": MessageLookupByLibrary.simpleMessage("Login Failure"),
        "loginFailureMsgOne": MessageLookupByLibrary.simpleMessage(
            "Login Data save failure, Please try again"),
        "loginUsername": m4,
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
        "monthAgo": m5,
        "more": MessageLookupByLibrary.simpleMessage("更多"),
        "myAccount": MessageLookupByLibrary.simpleMessage("My Account"),
        "myFavorite": MessageLookupByLibrary.simpleMessage("My Favorite"),
        "myPurse": MessageLookupByLibrary.simpleMessage("My Purse"),
        "myReviews": MessageLookupByLibrary.simpleMessage("My Reviews"),
        "nameInput": MessageLookupByLibrary.simpleMessage("name"),
        "needSignupMsg":
            MessageLookupByLibrary.simpleMessage("Don\'t have a account?"),
        "noBrowsedHistory": MessageLookupByLibrary.simpleMessage("無瀏覽產品"),
        "notification": MessageLookupByLibrary.simpleMessage("Notifications"),
        "notificationType1": MessageLookupByLibrary.simpleMessage("一般"),
        "notificationType2": MessageLookupByLibrary.simpleMessage("重要"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "orderCount": m6,
        "passwordInput": MessageLookupByLibrary.simpleMessage("password"),
        "personalInfo": MessageLookupByLibrary.simpleMessage("Personal Info"),
        "productCategory":
            MessageLookupByLibrary.simpleMessage("Product Category"),
        "productCollections":
            MessageLookupByLibrary.simpleMessage("Product Collection"),
        "productName": MessageLookupByLibrary.simpleMessage("Product Name"),
        "productSearchHint":
            MessageLookupByLibrary.simpleMessage("Search for a product"),
        "productSize": m7,
        "removeFromFavorite":
            MessageLookupByLibrary.simpleMessage("Remove Favorite"),
        "report": MessageLookupByLibrary.simpleMessage("檢舉"),
        "search": MessageLookupByLibrary.simpleMessage("Product Search"),
        "setting": MessageLookupByLibrary.simpleMessage("Setting"),
        "settingTheme": m8,
        "settingThemeAlert": m9,
        "shareHint": MessageLookupByLibrary.simpleMessage("Share"),
        "shoppingHistory":
            MessageLookupByLibrary.simpleMessage("Shopping History"),
        "signup": MessageLookupByLibrary.simpleMessage("Signup"),
        "signupFailure": MessageLookupByLibrary.simpleMessage("Signup failure"),
        "signupLabel": MessageLookupByLibrary.simpleMessage("Create"),
        "size": MessageLookupByLibrary.simpleMessage("Size"),
        "sizeHint": MessageLookupByLibrary.simpleMessage("Select Size"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "total": MessageLookupByLibrary.simpleMessage("Total"),
        "validating": MessageLookupByLibrary.simpleMessage("Validating..."),
        "visitorGreeting":
            MessageLookupByLibrary.simpleMessage("Hello, Visitor!"),
        "weeksAgo": m10,
        "yearsAgo": m11
      };
}
