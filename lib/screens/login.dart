import 'package:e_shopping/main.dart';
import 'package:e_shopping/providers/login_notifier.dart';
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
          centerTitle: true,
          title: Text("Login",),
        ),
        body: Container(
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
                              Text("validating"),
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
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 30,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
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
                              builder: (context) => HomeScreen(),
                            ), (r) => false,
                          );
                        }
                      },
                      child: Text("Login"),
                    ),
                    ElevatedButton(
                      onPressed: null,
                      child: Text("Sign Up"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}