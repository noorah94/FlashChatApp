import 'package:flutter/material.dart';
import '../globals.dart';

class Btn extends StatelessWidget {
  Btn({super.key, required this.type, required this.fun});
  int type;
  final Function fun;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => fun(type),
      style: ElevatedButton.styleFrom(
        //shadowColor: Colors.red,
        elevation: 10,
        backgroundColor: type == login ? loginColor : registerColor,
        foregroundColor: Colors.black,
        minimumSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.06),
      ),
      child: Text(type == login ? 'Log In' : 'Register'),
    );
  }
}
