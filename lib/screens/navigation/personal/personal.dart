import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {

  Widget personRow1({
    required BuildContext context,
    required VoidCallback? onTap,
    required IconData icon,
    required String rowName,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15,),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25,),
              child: AppLibScreen.appIcon(
                icon: icon,
                iconSize: "medium",
              ),
            ),
            AppLibScreen.appText(text: rowName,),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 5,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: Column(
              children: [
                personRow1(
                  context: context,
                  onTap: null,
                  icon: Icons.person_sharp,
                  rowName: S.current.myAccount,
                ),
                personRow1(
                  context: context,
                  onTap: null,
                  icon: Icons.history_sharp,
                  rowName: S.current.browsedHistory,
                ),
                personRow1(
                  context: context,
                  onTap: null,
                  icon: Icons.reviews_sharp,
                  rowName: S.current.myReviews,
                ),
                personRow1(
                  context: context,
                  onTap: null,
                  icon: Icons.favorite_border_sharp,
                  rowName: S.current.myFavorite,
                ),
                personRow1(
                  context: context,
                  onTap: null,
                  icon: Icons.monetization_on_sharp,
                  rowName: S.current.myPurse,
                ),
                personRow1(
                  context: context,
                  onTap: null,
                  icon: Icons.settings_sharp,
                  rowName: S.current.setting,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}