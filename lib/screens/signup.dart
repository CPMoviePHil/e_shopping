import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/signup_notifier.dart';
import 'package:e_shopping/utils/app_libs.dart';
import 'package:e_shopping/utils/widgets_helper.dart';
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
          appBarMsg: S.current.memberSignup,
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
                    hintText: S.current.nameInput,
                  ),
                ),
                TextFormField(
                  controller: accountController,
                  decoration: AppLibScreen.inputDecoration(
                    hintText: S.current.accountInput,
                  ),
                ),
                const SizedBox(height: 10,),
                Consumer<SignupNotifier>(
                  builder: (context, signup, _signup,) {
                    return TextFormField(
                      controller: passwordController,
                      obscureText: signup.hidePassword,
                      decoration: AppLibScreen.inputDecoration(
                        hintText: S.current.passwordInput,
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
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          await Provider.of<SignupNotifier>(
                            context,
                            listen: false,
                          ).formValidation(
                            name: nameController.text,
                            account: accountController.text,
                            password: passwordController.text,
                          );
                          if (context.read<SignupNotifier>().currentStatus == SignupStatus.failure) {
                            WidgetsHelper.showSnackBar(
                              context: context,
                              msg: S.current.signupFailure,
                            );
                          }
                          if (context.read<SignupNotifier>().currentStatus == SignupStatus.success) {
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
                          child: AppLibScreen.appText(
                            text: context.watch<SignupNotifier>().currentStatus == SignupStatus.validating
                                ? S.current.creating
                                : S.current.signupLabel,
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
                        onTap: context.watch<SignupNotifier>().currentStatus == SignupStatus.validating
                            ? null
                            : () => Navigator.of(context).pop(),
                        child: AppLibScreen.appText(
                          text: S.current.alreadyHaveAccount,
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