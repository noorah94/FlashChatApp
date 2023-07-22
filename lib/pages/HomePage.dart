import 'package:chat_task_t2/widgets/logo.dart';

import 'LoginRegisterPage.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import '../widgets/Btn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    goToLoginRegestrationPage(int type) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginRegisterPage(type: type),
          ),
        );

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Logo(),
              Btn(
                type: login,
                fun: goToLoginRegestrationPage,
              ),
              Btn(type: register, fun: goToLoginRegestrationPage),
            ],
          ),
        ),
      ),
    );
  }
}
