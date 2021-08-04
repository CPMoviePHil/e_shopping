import 'package:e_shopping/data/user.dart';

class CommentModel {
  final UserModel user;
  final String createTime;
  final int productID;
  final String comment;
  final double star;

  const CommentModel({
    required this.user,
    required this.createTime,
    required this.productID,
    required this.comment,
    required this.star,
  });
}