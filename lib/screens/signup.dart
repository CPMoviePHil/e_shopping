import 'package:e_shopping/providers/signup_notifier.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {

  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppLibScreen.commonAppBar(
          context: context,
          appBarMsg: "會員註冊",
        ),
        body: InkWell(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                TextFormField(
                  controller: nameController,
                  decoration: AppLibScreen.inputDecoration(
                    hintText: "輸入名字",
                  ),
                ),
                TextFormField(
                  controller: accountController,
                  decoration: AppLibScreen.inputDecoration(
                    hintText: "輸入帳號",
                  ),
                ),
                const SizedBox(height: 10,),
                Consumer<SignupNotifier>(
                  builder: (context, signup, _signup,) {
                    return TextFormField(
                      controller: passwordController,
                      obscureText: signup.hidePassword,
                      decoration: AppLibScreen.inputDecoration(
                        hintText: "輸入會員密碼",
                        suffixIcon: signup.hidePassword
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        suffixIconPress: () => signup.changeHidePassword(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: null,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5,),
                          child: AppLibScreen.appText(
                            text: "建立會員",
                            fontColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 70,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: AppLibScreen.appText(
                          text: "已經有會員帳號?",
                          fontColor: Theme.of(context).accentColor,
                          textSize: "small",
                        ),
                      ),
                    ],
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