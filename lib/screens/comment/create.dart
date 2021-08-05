import 'package:e_shopping/configs/theme/colors.dart';
import 'package:e_shopping/data/product.dart';
import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateComment extends StatelessWidget {

  final Product product;
  final FocusNode focusNode = FocusNode();

  CreateComment({required this.product,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: GestureDetector(
            onTap: Utils.outOfScreen(context: context),
            child: Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppLibScreen.appText(text: S.current.comments),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppLibScreen.appText(text: product.name),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppLibScreen.ratingBar(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: kGrey400,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10,)),
                          ),
                          child: TextFormField(
                            focusNode: focusNode,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: S.current.commentHint,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 10,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: AppLibScreen.appIcon(icon: Icons.close),
                  ),
                ),
                Positioned(
                  top: 14.5,
                  right: 10,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: AppLibScreen.appIcon(icon: Icons.check_sharp,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}