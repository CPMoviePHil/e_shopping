import 'package:e_shopping/configs/theme/colors.dart';
import 'package:e_shopping/data/comment.dart';
import 'package:e_shopping/screens/user/profile.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/cupertino.dart';

class CommentScreen extends StatelessWidget {

  final CommentModel comment;

  const CommentScreen({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,),
      child: Row(
        children: [
          Container(
            child: UserProfile(
              imagePath: comment.user.profile!,
              size: 60,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLibScreen.starsWidget(stars: comment.star, size: 16,),
                Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLibScreen.appText(
                        text: comment.user.userName,
                        textSize: "small",
                      ),
                      AppLibScreen.appText(
                        text: comment.comment,
                        fontColor: kGrey600,
                        textSize: "small",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}