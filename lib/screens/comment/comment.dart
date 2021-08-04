import 'package:e_shopping/configs/theme/colors.dart';
import 'package:e_shopping/data/comment.dart';
import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/screens/user/profile.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {

  final CommentModel comment;

  const CommentScreen({required this.comment});

  bool isToday ({required DateTime dateTime}) {
    return dateTime.day == DateTime.now().day;
  }

  String parsedCreateTime ({required DateTime createTime,}) {
    if (isToday(dateTime: createTime)) {
      return WidgetsHelper.dateTimeToStr(datetime: createTime, format: "onlyTime");
    } else {
      return S.current.commentDay(DateTime.now().difference(createTime).inDays);
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime createTime = WidgetsHelper.strToDateTime(str: comment.createTime,);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppLibScreen.starsWidget(
                          stars: comment.star, size: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, bottom: 2,),
                          child: AppLibScreen.appText(
                            text: parsedCreateTime(createTime: createTime,),
                            textSize: "small",
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2,),
                      child: AppLibScreen.appText(
                        text: comment.user.userName,
                        textSize: "small",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2,),
                      child: AppLibScreen.appText(
                        text: comment.comment,
                        fontColor: kGrey600,
                        textSize: "small",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppLibScreen.appIcon(
            icon: Icons.more_vert_sharp,
            iconSize: "small",
            iconColor: kGrey600,
          ),
        ],
      ),
    );
  }
}