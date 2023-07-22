import '../Controllers/UserController.dart';
import '../Services/AuthenticationService.dart';
import '../globals.dart';
import '/widgets/Input.dart';
import 'package:flutter/material.dart';
import '../widgets/Btn.dart';
import 'ChatPage.dart';

class LoginRegisterPage extends StatelessWidget {
  LoginRegisterPage({super.key, required this.type});
  int type;

  @override
  Widget build(BuildContext context) {
    void goToChatPage() => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(),
          ),
        );

    errorDesc() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(type == login
              ? "Email or password is not correct..."
              : UserController.registerErrorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'ok'),
              child: const Text('ok'),
            ),
          ],
        ),
      );
    }

    authenticationFun(int type) {
      //reg();
      Future<bool> isSuccess = type == login
          ? loginService() //UserController.userLogin()
          : registerService(); //UserController.userRegister();
      isSuccess.then((value) => value == true ? goToChatPage() : errorDesc());
    }

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.70,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                  tag: "DemoTag",
                  child: Image.asset(
                    'images/logo.png',
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width * 0.50,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Input(
                        title: 'Enter your Email',
                        isPass: false,
                        type: type,
                      ),
                      Input(
                        title: 'Enter your Password',
                        isPass: true,
                        type: type,
                      ),
                    ],
                  ),
                ),
                Btn(
                  type: type,
                  fun: authenticationFun,
                ),
              ]),
        ),
      ),
    );
  }
}
