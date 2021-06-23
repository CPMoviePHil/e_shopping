import 'package:e_shopping/providers/loading_server_data_notifier.dart';
import 'package:e_shopping/providers/login_notifier.dart';
import 'package:e_shopping/screens/user_data_loading.dart';
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
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: AppLibScreen.appText(
            text: "會員登入",
          ),
        ),
        body: Container(
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
                              Text("驗證中..."),
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
                decoration: WidgetsHelper.inputDecoration(
                  hintText: "account",
                ),
              ),
              const SizedBox(height: 10,),
              Consumer<LoginNotifier>(
                builder: (context, login, _login,) {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: login.hidePassword,
                    decoration: WidgetsHelper.inputDecoration(
                      hintText: "password",
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
                        await Provider.of<LoginNotifier>(
                          context,
                          listen: false,
                        ).formValidation(
                          account: accountController.text,
                          password: passwordController.text,
                        );
                        if (context.read<LoginNotifier>().currentStatus == LoginStatus.failure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: const Text("登入失敗"),
                            ),
                          );
                        }
                        if (context.read<LoginNotifier>().currentStatus == LoginStatus.save_failure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: const Text("登入資料儲存失敗，請在試一次"),
                            ),
                          );
                        }
                        if (context.read<LoginNotifier>().currentStatus == LoginStatus.success) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                create: (context) => LoadingDataNotifier()..loadingUserDataProcess(
                                  context: context,
                                ),
                                child: UserDataLoading(),
                              ),
                            ), (r) => false,
                          );
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
                        child: AppLibScreen.appText(text: "登入", fontColor: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 90,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLibScreen.appText(text: "沒有帳號嗎?", textSize: "small",),
                    GestureDetector(
                      child: AppLibScreen.appText(
                        text: "註冊",
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
    );
  }
}