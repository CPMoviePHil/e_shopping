import 'package:flutter/cupertino.dart';

class UserModel {
  final int id;
  final String account;
  final String userName;
  const UserModel({
    @required this.id,
    @required this.account,
    @required this.userName,
  });
}