import '../globals.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input({
    super.key,
    required this.title,
    required this.isPass,
    required this.type,
  });

  String title;
  bool isPass;
  int type;

  @override
  Widget build(BuildContext context) {
    borderInput(double width) => OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(50.0),
          ),
          borderSide: BorderSide(
              width: width, color: type == login ? loginColor : registerColor),
        );

    return TextField(
      textAlign: TextAlign.center,
      onChanged: (val) =>
          isPass ? userModel.password = val : userModel.email = val,
      obscureText: isPass,
      decoration: InputDecoration(
        enabledBorder: borderInput(2),
        focusedBorder: borderInput(5),
        //labelText: 'User Name',
        hintText: title,
      ),
    );
  }
}
