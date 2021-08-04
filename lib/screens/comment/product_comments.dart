import 'package:e_shopping/data/comment.dart';
import 'package:e_shopping/screens/comment/comment.dart';
import 'package:flutter/cupertino.dart';

class ProductCommentsScreen extends StatelessWidget {

  final List<CommentModel> comments;

  const ProductCommentsScreen({
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: comments.map((e) => CommentScreen(comment: e)).toList(),
    );
  }
}