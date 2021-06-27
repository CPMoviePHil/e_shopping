import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/config_notifier.dart';
import 'package:e_shopping/providers/login_notifier.dart';
import 'package:e_shopping/providers/signup_notifier.dart';
import 'package:e_shopping/screens/signup.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/widgets_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {

  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppLibScreen.commonAppBar(
          context: context,
          appBarMsg: S.current.memberLogin,
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
                Consumer<LoginNotifier>(
                  builder: (context, login, _login,) {
                    if (login.currentStatus == LoginStatus.validating) {
                      return Center(
                        child: Dialog(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20,),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(),
                                const SizedBox(width: 20,),
                                Text(S.current.validating),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                const SizedBox(height: 50,),
                TextFormField(
                  controller: accountController,
                  decoration: AppLibScreen.inputDecoration(
                    hintText: S.current.accountInput,
                  ),
                ),
                const SizedBox(height: 10,),
                Consumer<LoginNotifier>(
                  builder: (context, login, _login,) {
                    return TextFormField(
                      controller: passwordController,
                      obscureText: login.hidePassword,
                      decoration: AppLibScreen.inputDecoration(
                        hintText: S.current.passwordInput,
                        suffixIcon: login.hidePassword
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        suffixIconPress: () => login.changeHidePassword(),
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
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          await Provider.of<LoginNotifier>(
                            context,
                            listen: false,
                          ).formValidation(
                            account: accountController.text,
                            password: passwordController.text,
                          );
                          if (context.read<LoginNotifier>().currentStatus == LoginStatus.failure) {
                            WidgetsHelper.showSnackBar(
                              context: context,
                              msg: S.current.loginFailure,
                            );
                          }
                          if (context.read<LoginNotifier>().currentStatus == LoginStatus.save_failure) {
                            WidgetsHelper.showSnackBar(
                              context: context,
                              msg: S.current.loginFailureMsgOne,
                            );
                          }
                          if (context.read<LoginNotifier>().currentStatus == LoginStatus.success) {
                            context.read<ConfigNotifier>().setLogin();
                            Navigator.of(context).pop();
                          }
                        },
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
                          child: AppLibScreen.appText(text: S.current.login, fontColor: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 70,),
                Container(
                  //padding: const EdgeInsets.symmetric(horizontal: 100,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppLibScreen.appText(text: S.current.needSignupMsg, textSize: "small",),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                create: (context) => SignupNotifier(),
                                child: Signup(),
                              ),
                            ),
                          );
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: AppLibScreen.appText(
                          text: S.current.signup,
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